import 'package:flutter/gestures.dart';
import 'package:intl/intl.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:skeletonizer/skeletonizer.dart'; // Make sure to add this package to your pubspec.yaml

class UiVerticalPredictionTimeline extends StatefulHookWidget {
  const UiVerticalPredictionTimeline({
    required this.notifier,
    required this.onDateChanged,
    this.params = const UiPredictionTimelineParams(),
    super.key,
  });
  final UiPredictionTimelineParams params;
  final UiTimelineNotifier notifier;
  final ValueChanged<DateTime> onDateChanged;
  static const kDefaultWidth = 100.0;
  @override
  _UiVerticalPredictionTimelineState createState() =>
      _UiVerticalPredictionTimelineState();
}

class _UiVerticalPredictionTimelineState
    extends State<UiVerticalPredictionTimeline> {
  static const _defaultItemsCount = 5;
  late final _pageController = PageController(
    initialPage: _notifier.selectedIndex,
    viewportFraction: _params.enableMouseControls ? 1 / _visibleItemCount : 1,
  );

  final _itemExtent = 58.0;
  int _visibleItemCount = _defaultItemsCount;
  UiPredictionTimelineParams get _params => widget.params;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((final timeStamp) {
      unawaited(_load());
    });
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
    final screenHeight = MediaQuery.sizeOf(context).height;
    return (screenHeight / _itemExtent).floor().clamp(_defaultItemsCount, 20);
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

  List<DateTime> get _availableDates => _notifier.value.availableDates;

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    final itemCount = _calculateVisibleItemCount();
    useListenable(_notifier);
    if (_visibleItemCount != itemCount) {
      _visibleItemCount = itemCount;
    }

    if (_notifier.isLoading) return _buildSkeletonLoader();
    final isToday = _isCurrentDate(_notifier.currentDate);
    return SizedBox(
      width: UiVerticalPredictionTimeline.kDefaultWidth,
      child: Column(
        children: [
          SizedBox(
            height: 40,
            child: UiTextButton(
              onPressed: () => _notifier.scrollToCurrentDate(_pageController),
              padding: EdgeInsets.zero,
              title: Text(
                '${_getFormattedDate(_notifier.currentDate, locale)} '
                '${isToday ? LocalizedMap( {languages.en: '(today)', languages.it: '(oggi)', languages.ru: '(сегодня)'}).getValue(locale) : ''}',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withOpacity(0.8),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                _buildPageView(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.arrow_right_rounded,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                if (_params.showArrowButtons)
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: context.colorScheme.surface,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_circle_up_rounded,
                          size: 38,
                          color: context.colorScheme.onSurface.withOpacity(0.6),
                        ),
                        onPressed:
                            () async => _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            ),
                      ),
                    ),
                  ),
                if (_params.showArrowButtons)
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: context.colorScheme.surface,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_circle_down_rounded,
                          size: 38,
                          color: context.colorScheme.onSurface.withOpacity(0.6),
                        ),
                        onPressed:
                            () async => _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            ),
                      ),
                    ),
                  ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 48),
                    child: Text(
                      _getFormattedDateMMYY(
                        _calculateTopMostVisibleDate(),
                        locale,
                      ),
                      style: context.textTheme.labelLarge,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  DateTime _calculateTopMostVisibleDate() =>
      _availableDates[_notifier.selectedIndex -
          (_visibleItemCount / 2).round()];

  Widget _buildPageView() =>
      _params.enableMouseWheelScroll
          ? Listener(
            onPointerSignal: _handleMouseScroll,
            child: _buildPageViewContent(),
          )
          : _buildPageViewContent();

  Widget _buildPageViewContent() => PageView.builder(
    scrollDirection: Axis.vertical,
    controller: _pageController,
    onPageChanged: _onPageChanged,
    itemCount: _availableDates.length,
    itemBuilder: (final context, final index) => _buildDateItem(index),
  );

  Widget _buildDateItem(final int index) =>
      _params.enableMouseControls
          ? MouseRegion(
            cursor: SystemMouseCursors.click,
            child: _buildDateButton(index),
          )
          : _buildDateButton(index);

  Widget _buildDateButton(final int index) {
    final locale = useLocale(context);
    final date = _availableDates[index];
    final isToday = _isCurrentDate(date);
    final isSelected = index == _notifier.selectedIndex;
    return Stack(
      alignment: Alignment.center,
      children: [
        UiBaseButton(
          onPressed:
              () async => _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              ),
          builder:
              (final context, final focused, final onlyFocused) =>
                  UiPredictionDay(
                    day: _getDisplayText(_availableDates[index]),
                    isSelected: isSelected,
                    isCurrentDate: isToday,
                  ),
        ),
        if (date.day == 1)
          Align(
            alignment: Alignment.topLeft,
            child: Text(_getFormattedDateMMYY(date, locale)),
          ),
      ],
    );
  }

  Widget _buildSkeletonLoader() => Skeletonizer(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 50,
          width: UiVerticalPredictionTimeline.kDefaultWidth,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemExtent: _itemExtent,
            itemCount: 7,
            itemBuilder:
                (final context, final index) => const UiPredictionDay(
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

  String _getDisplayText(final DateTime date, {final bool useNumbers = true}) {
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
        return DateFormat('EEEE, d', locale.languageCode).format(date);
      case UiPresentationType.month:
        return DateFormat('MMMM yyyy', locale.languageCode).format(date);
      case UiPresentationType.year:
        return date.year.toString();
    }
  }

  String _getFormattedDateMMYY(final DateTime date, final Locale locale) =>
      DateFormat('MMMM yyyy', locale.languageCode).format(date);
}
