import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/ui_prediction/expensess_prediction_models.dart';

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
  Widget build(final BuildContext context) => LineChart(
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
        ),
      );

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
}
