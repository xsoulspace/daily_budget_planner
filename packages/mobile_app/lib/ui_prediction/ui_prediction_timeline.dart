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
    super.key,
  });

  final PresentationType presentationType;
  final DateTime initialDate;
  final ValueChanged<DateTime> onDateChanged;

  @override
  _UiPredictionTimelineState createState() => _UiPredictionTimelineState();
}

class _UiPredictionTimelineState extends State<UiPredictionTimeline> {
  late final PageController _pageController;
  late final List<DateTime> _dates;
  late int _selectedIndex;
  final _itemExtent = 58.0;
  bool _isLoading = true;

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
        viewportFraction: _itemExtent / MediaQuery.sizeOf(context).width,
      );
    });

    if (mounted) {
      setState(() => _isLoading = false);
    }
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

  @override
  Widget build(final BuildContext context) => _isLoading
      ? _buildSkeletonLoader()
      : Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 50,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: _dates.length,
                itemBuilder: (final context, final index) => UiBaseButton(
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
                ),
              ),
            ),
            const SizedBox(height: 8),
            Icon(
              Icons.arrow_drop_up_rounded,
              color: Theme.of(context).primaryColor,
            ),
            UiTextButton(
              onPressed: () async => _pageController.animateToPage(
                _selectedIndex,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              ),
              padding: EdgeInsets.zero,
              title: Text(
                '${_getFormattedDate(_dates[_selectedIndex])}'
                '${_isCurrentDate(_dates[_selectedIndex]) ? ' (today)' : ''}',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.8),
                    ),
              ),
            ),
          ],
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

  String _getDisplayText(final DateTime date) {
    final displayText = switch (widget.presentationType) {
      PresentationType.day => DateFormat('E').format(date)[0],
      PresentationType.month => DateFormat('MMM').format(date)[0],
      PresentationType.year => date.year.toString().substring(2),
    };
    return displayText;
  }

  String _getFormattedDate(final DateTime date) {
    switch (widget.presentationType) {
      case PresentationType.day:
        return DateFormat('EEEE, d MMMM yyyy').format(date);
      case PresentationType.month:
        return DateFormat('MMMM yyyy').format(date);
      case PresentationType.year:
        return date.year.toString();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
        margin: const EdgeInsets.symmetric(horizontal: 4),
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
