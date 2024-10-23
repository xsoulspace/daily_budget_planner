import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/ui_prediction/transaction_models.dart';

class ExpensesPredictionGraph extends StatelessWidget {
  const ExpensesPredictionGraph({
    required this.budgetSpots,
    required this.expenseSpots,
    required this.budgetPrediction,
    required this.expensesPrediction,
    required this.period,
    super.key,
  });
  final List<FlSpot> budgetSpots;
  final List<FlSpot> expenseSpots;
  final PredictionType budgetPrediction;
  final PredictionType expensesPrediction;
  final Period period;

  @override
  Widget build(final BuildContext context) {
    if (budgetSpots.isEmpty && expenseSpots.isEmpty) {
      return const SizedBox.shrink();
    }
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: budgetSpots,
            color: Colors.blue,
            isCurved: true,
          ),
          LineChartBarData(
            spots: expenseSpots,
            color: Colors.red,
            isCurved: true,
          ),
        ],
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (final value, final meta) =>
                  Text(_getBottomTitle(value, period)),
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 28,
              getTitlesWidget: (final value, final meta) =>
                  Text(value.toStringAsFixed(0)),
            ),
          ),
        ),
        gridData: FlGridData(),
        borderData: FlBorderData(show: true),
        lineTouchData: LineTouchData(),
        minX: _getMinX(),
        maxX: _getMaxX(),
        minY: _getMinY(),
        maxY: _getMaxY(),
      ),
    );
  }

  String _getBottomTitle(final double value, final Period period) {
    final date = DateTime.fromMillisecondsSinceEpoch(value.toInt());
    switch (period) {
      case Period.daily:
        return '${date.hour}:00';
      case Period.weekly:
        return '${date.day}/${date.month}';
      case Period.monthly:
        return '${date.day}';
      case Period.yearly:
        return '${date.month}/${date.year}';
    }
  }

  double _getMinX() {
    final allSpots = [...budgetSpots, ...expenseSpots];
    if (allSpots.isEmpty) return 0;
    return allSpots.map((final spot) => spot.x).reduce(
          (final a, final b) => a < b ? a : b,
        );
  }

  double _getMaxX() {
    final allSpots = [...budgetSpots, ...expenseSpots];
    if (allSpots.isEmpty) return 1;
    return allSpots.map((final spot) => spot.x).reduce(
          (final a, final b) => a > b ? a : b,
        );
  }

  double _getMinY() {
    final allSpots = [...budgetSpots, ...expenseSpots];
    if (allSpots.isEmpty) return 0;
    return allSpots.map((final spot) => spot.y).reduce(
          (final a, final b) => a < b ? a : b,
        );
  }

  double _getMaxY() {
    final allSpots = [...budgetSpots, ...expenseSpots];
    if (allSpots.isEmpty) return 1;
    return allSpots.map((final spot) => spot.y).reduce(
          (final a, final b) => a > b ? a : b,
        );
  }
}
