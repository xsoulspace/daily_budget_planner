import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  late ScrollController _scrollController;
  late List<DateTime> _dates;
  late int _centerIndex;
  final _itemExtent = 58.0; // 50 for the circle + 8 for margins

  @override
  void initState() {
    super.initState();
    _initializeDates();
    _scrollController = ScrollController(
      initialScrollOffset: _centerIndex * _itemExtent,
    );
    WidgetsBinding.instance
        .addPostFrameCallback((final _) => _setUpScrollListener());
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
    _centerIndex = _dates.indexOf(
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

  void _setUpScrollListener() {
    _scrollController.addListener(() {
      final middleIndex = (_scrollController.offset / _itemExtent).round();
      if (middleIndex != _centerIndex) {
        setState(() => _centerIndex = middleIndex);
        widget.onDateChanged(_dates[_centerIndex]);
      }
    });
  }

  @override
  Widget build(final BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 50,
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemExtent: _itemExtent,
              itemCount: _dates.length,
              itemBuilder: (final context, final index) => UiPredictionDay(
                day: _getDisplayText(_dates[index]),
                isSelected: index == _centerIndex,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(_getFormattedDate(_dates[_centerIndex])),
        ],
      );

  String _getDisplayText(final DateTime date) {
    switch (widget.presentationType) {
      case PresentationType.day:
        return DateFormat('E').format(date)[0];
      case PresentationType.month:
        return DateFormat('MMM').format(date)[0];
      case PresentationType.year:
        return date.year.toString().substring(2);
    }
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
    _scrollController.dispose();
    super.dispose();
  }
}

class UiPredictionDay extends StatelessWidget {
  const UiPredictionDay({
    required this.day,
    required this.isSelected,
    super.key,
  });

  final String day;
  final bool isSelected;

  @override
  Widget build(final BuildContext context) => Container(
        width: 50,
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? Theme.of(context).primaryColor : Colors.grey,
            width: isSelected ? 2 : 1,
          ),
          color: isSelected
              ? Theme.of(context).primaryColor.withOpacity(0.1)
              : null,
        ),
        child: Center(
          child: Text(
            day,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Theme.of(context).primaryColor : null,
            ),
          ),
        ),
      );
}
