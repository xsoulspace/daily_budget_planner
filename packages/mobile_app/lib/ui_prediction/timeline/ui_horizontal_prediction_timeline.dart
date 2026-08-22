import 'package:flutter/gestures.dart';
import 'package:intl/intl.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:skeletonizer/skeletonizer.dart'; // Make sure to add this package to your pubspec.yaml

class UiHorizontalPredictionTimeline extends StatefulWidget {
  const UiHorizontalPredictionTimeline({
    required this.notifier,
    required this.onDateChanged,
    this.params = const UiPredictionTimelineParams(),
    super.key,
  });
  final UiPredictionTimelineParams params;
  final UiTimelineNotifier notifier;
  final ValueChanged<DateTime> onDateChanged;
  static const kDefaultHeight = 50.0;

  @override
  _UiHorizontalPredictionTimelineState createState() =>
      _UiHorizontalPredictionTimelineState();
}

class _UiHorizontalPredictionTimelineState
    extends State<UiHorizontalPredictionTimeline> {
  static const _defaultItemsCount = 5;
  late final PageController _pageController = PageController(
    initialPage: _notifier.selectedIndex,
    viewportFraction: _params.enableMouseControls ? 1 / _visibleItemCount : 1,
  );
  List<DateTime> get _availableDates => _notifier.value.availableDates;
  final _itemExtent = 58.0;
  int _visibleItemCount = _defaultItemsCount;
  UiPredictionTimelineParams get _params => widget.params;
  @override
  void initState() {
    super.initState();
    unawaited(_load());
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  UiTimelineNotifier get _notifier => widget.notifier;
  Future<void> _load() async {
    if (mounted) _notifier.isLoading = false;
  }

  int _calculateVisibleItemCount() {
    if (!_params.enableMouseControls) return 1;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return (screenWidth / _itemExtent).floor().clamp(_defaultItemsCount, 20);
  }

  void _onPageChanged(final int index) {
    _notifier.selectedIndex = index;
    widget.onDateChanged(_notifier.currentDate);
  }

  void _handleMouseScroll(final PointerSignalEvent event) {
    if (_params.enableMouseWheelScroll && event is PointerScrollEvent) {
      final delta = event.scrollDelta.dy;
      _pageController.jumpTo(_pageController.offset + delta);
    }
  }

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    final itemCount = _calculateVisibleItemCount();
    if (_visibleItemCount != itemCount) {
      _visibleItemCount = itemCount;
    }

    if (_notifier.isLoading) return _buildSkeletonLoader();
    final isToday = _isCurrentDate(_notifier.currentDate);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        UiTextButton(
          onPressed: () => _notifier.scrollToCurrentDate(_pageController),
          padding: EdgeInsets.zero,
          title: Text(
            '${_getFormattedDate(_notifier.currentDate, locale)} '
            '${isToday ? LocalizedMap(
        {
                  languages.en: '(today)',
                  languages.it: '(oggi)',
                  languages.ru: '(сегодня)',
                },
              ).getValue(locale) : ''}',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                ),
          ),
        ),
        Icon(
          Icons.arrow_drop_down_rounded,
          color: Theme.of(context).primaryColor,
        ),
        Stack(
          children: [
            _buildPageView(),
            if (_params.showArrowButtons)
              Positioned(
                top: 0,
                left: 0,
                bottom: 0,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: context.colorScheme.surface,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(100),
                      bottomRight: Radius.circular(100),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 16,
                        color: context.colorScheme.onSurface.withOpacity(
                          0.6,
                        ),
                      ),
                      onPressed: () async => _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      ),
                    ),
                  ),
                ),
              ),
            if (_params.showArrowButtons)
              Positioned(
                top: 0,
                right: 0,
                bottom: 0,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: context.colorScheme.surface,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      bottomLeft: Radius.circular(100),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 16,
                        color: context.colorScheme.onSurface.withOpacity(
                          0.6,
                        ),
                      ),
                      onPressed: () async => _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildPageView() => _params.enableMouseWheelScroll
      ? Listener(
          onPointerSignal: _handleMouseScroll,
          child: _buildPageViewContent(),
        )
      : _buildPageViewContent();

  Widget _buildPageViewContent() => SizedBox(
        height: UiHorizontalPredictionTimeline.kDefaultHeight,
        child: PageView.builder(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          itemCount: _availableDates.length,
          itemBuilder: (final context, final index) => _buildDateItem(index),
        ),
      );

  Widget _buildDateItem(final int index) => _params.enableMouseControls
      ? MouseRegion(
          cursor: SystemMouseCursors.click,
          child: _buildDateButton(index),
        )
      : _buildDateButton(index);

  Widget _buildDateButton(final int index) => UiBaseButton(
        onPressed: () async => _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        ),
        builder: (final context, final focused, final onlyFocused) =>
            UiPredictionDay(
          day: _getDisplayText(_availableDates[index]),
          isSelected: index == _notifier.selectedIndex,
          isCurrentDate: _isCurrentDate(_availableDates[index]),
        ),
      );

  Widget _buildSkeletonLoader() => Skeletonizer(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemExtent: _itemExtent,
                itemCount: 7,
                itemBuilder: (final context, final index) =>
                    const UiPredictionDay(
                  day: 'X',
                  isSelected: false,
                  isCurrentDate: false,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Text('Loading...'),
          ],
        ),
      );

  bool _isCurrentDate(final DateTime date) {
    final now = DateTime.now();
    switch (_notifier.presentationType) {
      case UiPresentationType.day:
        return date.year == now.year &&
            date.month == now.month &&
            date.day == now.day;
      case UiPresentationType.month:
        return date.year == now.year && date.month == now.month;
      case UiPresentationType.year:
        return date.year == now.year;
    }
  }

  String _getDisplayText(
    final DateTime date, {
    final bool useNumbers = true,
  }) {
    if (!useNumbers) {
      return switch (_notifier.presentationType) {
        UiPresentationType.day => DateFormat('E').format(date)[0],
        UiPresentationType.month => DateFormat('MMM').format(date)[0],
        UiPresentationType.year => date.year.toString().substring(2),
      };
    } else {
      return switch (_notifier.presentationType) {
        UiPresentationType.day => DateFormat('d').format(date),
        UiPresentationType.month => DateFormat('MMM').format(date)[0],
        UiPresentationType.year => date.year.toString().substring(2),
      };
    }
  }

  String _getFormattedDate(final DateTime date, final Locale locale) {
    switch (_notifier.presentationType) {
      case UiPresentationType.day:
        return DateFormat('EEEE, d MMMM yyyy', locale.languageCode)
            .format(date);
      case UiPresentationType.month:
        return DateFormat('MMMM yyyy', locale.languageCode).format(date);
      case UiPresentationType.year:
        return date.year.toString();
    }
  }
}

class UiPredictionDay extends StatelessWidget {
  const UiPredictionDay({
    required this.day,
    required this.isSelected,
    required this.isCurrentDate,
    super.key,
  });

  final String day;
  final bool isSelected;
  final bool isCurrentDate;

  @override
  Widget build(final BuildContext context) => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 50,
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected
                ? Theme.of(context).primaryColor
                : Theme.of(context).primaryColor.withOpacity(0.1),
            width: isSelected ? 2 : 1,
          ),
          color: isCurrentDate
              ? Theme.of(context).primaryColor.withOpacity(0.1)
              : null,
        ),
        child: Center(
          child: Text(
            day,
            style: TextStyle(
              fontWeight: isSelected || isCurrentDate
                  ? FontWeight.bold
                  : FontWeight.normal,
              color: isSelected || isCurrentDate
                  ? Theme.of(context).primaryColor
                  : null,
            ),
          ),
        ),
      );
}
