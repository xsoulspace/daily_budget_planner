import 'package:flutter/gestures.dart';
import 'package:intl/intl.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_paywalls/2024_monthly_subscription_paywall.dart';
import 'package:skeletonizer/skeletonizer.dart'; // Make sure to add this package to your pubspec.yaml

enum PresentationType { day, month, year }

class UiPredictionTimeline extends StatefulWidget {
  const UiPredictionTimeline({
    required this.presentationType,
    required this.initialDate,
    required this.onDateChanged,
    this.enableMouseControls = true,
    this.showArrowButtons = true,
    this.enableMouseWheelScroll = false,
    super.key,
  });

  final PresentationType presentationType;
  final DateTime initialDate;
  final ValueChanged<DateTime> onDateChanged;
  final bool enableMouseControls;
  final bool showArrowButtons;
  final bool enableMouseWheelScroll;

  @override
  _UiPredictionTimelineState createState() => _UiPredictionTimelineState();
}

class _UiPredictionTimelineState extends State<UiPredictionTimeline> {
  late final PageController _pageController;
  late final List<DateTime> _dates;
  late int _selectedIndex;
  final _itemExtent = 58.0;
  bool _isLoading = true;
  int _visibleItemCount = 5;

  @override
  void initState() {
    super.initState();
    unawaited(_load());
  }

  Future<void> _load() async {
    await Future.microtask(() {
      _initializeDates();
      _pageController = PageController(
        initialPage: _selectedIndex,
        viewportFraction:
            widget.enableMouseControls ? 1 / _visibleItemCount : 1,
      );
    });

    if (mounted) {
      setState(() => _isLoading = false);
    }
  }

  int _calculateVisibleItemCount() {
    if (!widget.enableMouseControls) return 1;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return (screenWidth / _itemExtent).floor().clamp(5, 20);
  }

  void _initializeDates() {
    final now = DateTime.now();
    switch (widget.presentationType) {
      case PresentationType.day:
        _dates = List.generate(
          10000,
          (final index) => now.subtract(Duration(days: 5000 - index)),
        );
      case PresentationType.month:
        _dates = List.generate(
          10000,
          (final index) => DateTime(now.year, now.month - (5000 - index)),
        );
      case PresentationType.year:
        _dates = List.generate(
          10000,
          (final index) => DateTime(now.year - (5000 - index)),
        );
    }
    _selectedIndex = _dates.indexOf(
      _dates.firstWhere(
        (final date) =>
            date.year == widget.initialDate.year &&
            date.month == widget.initialDate.month &&
            (widget.presentationType == PresentationType.day
                ? date.day == widget.initialDate.day
                : true),
      ),
    );
  }

  void _onPageChanged(final int index) {
    setState(() => _selectedIndex = index);
    widget.onDateChanged(_dates[_selectedIndex]);
  }

  void _handleMouseScroll(final PointerSignalEvent event) {
    if (widget.enableMouseWheelScroll && event is PointerScrollEvent) {
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

    if (_isLoading) return _buildSkeletonLoader();
    final isToday = _isCurrentDate(_dates[_selectedIndex]);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        UiTextButton(
          onPressed: _scrollToCurrentDate,
          padding: EdgeInsets.zero,
          title: Text(
            '${_getFormattedDate(_dates[_selectedIndex], locale)} '
            '${isToday ? LocalizedMap(
                value: {
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
            if (widget.showArrowButtons)
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
            if (widget.showArrowButtons)
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

  Widget _buildPageView() => widget.enableMouseWheelScroll
      ? Listener(
          onPointerSignal: _handleMouseScroll,
          child: _buildPageViewContent(),
        )
      : _buildPageViewContent();

  Widget _buildPageViewContent() => SizedBox(
        height: 50,
        child: PageView.builder(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          itemCount: _dates.length,
          itemBuilder: (final context, final index) => _buildDateItem(index),
        ),
      );

  Widget _buildDateItem(final int index) => widget.enableMouseControls
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
          day: _getDisplayText(_dates[index]),
          isSelected: index == _selectedIndex,
          isCurrentDate: _isCurrentDate(_dates[index]),
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
    switch (widget.presentationType) {
      case PresentationType.day:
        return date.year == now.year &&
            date.month == now.month &&
            date.day == now.day;
      case PresentationType.month:
        return date.year == now.year && date.month == now.month;
      case PresentationType.year:
        return date.year == now.year;
    }
  }

  String _getDisplayText(
    final DateTime date, {
    final bool useNumbers = true,
  }) {
    if (!useNumbers) {
      return switch (widget.presentationType) {
        PresentationType.day => DateFormat('E').format(date)[0],
        PresentationType.month => DateFormat('MMM').format(date)[0],
        PresentationType.year => date.year.toString().substring(2),
      };
    } else {
      return switch (widget.presentationType) {
        PresentationType.day => DateFormat('d').format(date),
        PresentationType.month => DateFormat('MMM').format(date)[0],
        PresentationType.year => date.year.toString().substring(2),
      };
    }
  }

  String _getFormattedDate(final DateTime date, final Locale locale) {
    switch (widget.presentationType) {
      case PresentationType.day:
        return DateFormat('EEEE, d MMMM yyyy', locale.languageCode)
            .format(date);
      case PresentationType.month:
        return DateFormat('MMMM yyyy', locale.languageCode).format(date);
      case PresentationType.year:
        return date.year.toString();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _scrollToCurrentDate() {
    final now = DateTime.now();
    final currentDateIndex = _dates.indexWhere((final date) {
      switch (widget.presentationType) {
        case PresentationType.day:
          return date.year == now.year &&
              date.month == now.month &&
              date.day == now.day;
        case PresentationType.month:
          return date.year == now.year && date.month == now.month;
        case PresentationType.year:
          return date.year == now.year;
      }
    });

    if (currentDateIndex != -1) {
      unawaited(
        _pageController.animateToPage(
          currentDateIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        ),
      );
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
