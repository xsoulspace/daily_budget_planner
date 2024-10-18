import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/ui_prediction/expenses_prediction_graph.dart';
import 'package:mobile_app/ui_prediction/expenses_prediction_notifier.dart';
import 'package:mobile_app/ui_prediction/expensess_prediction_models.dart';
import 'package:provider/provider.dart';

class ExpensesPredictionScreen extends StatelessWidget {
  const ExpensesPredictionScreen({super.key});

  @override
  Widget build(final BuildContext context) =>
      Consumer<ExpensesPredictionNotifier>(
        builder: (final context, final notifier, final child) => Scaffold(
          appBar: AppBar(title: const Text('Expenses Prediction')),
          body: Column(
            children: [
              ExpensesPredictionGraph(
                budgetSpots: _getBudgetSpots(notifier),
                expenseSpots: _getExpenseSpots(notifier),
                budgetPrediction: notifier.budgetPrediction,
                expensesPrediction: notifier.expensesPrediction,
                period: notifier.currentPeriod,
              ),
              _buildSummaryCards(notifier),
              _buildPeriodSelector(notifier),
            ],
          ),
        ),
      );

  Widget _buildSummaryCards(final ExpensesPredictionNotifier notifier) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _SummaryCard(
            title: 'Average Budget',
            amount: notifier.averageDailyBudget,
            predictionType: notifier.budgetPrediction,
          ),
          _SummaryCard(
            title: 'Average Expenses',
            amount: notifier.averageDailyExpense,
            predictionType: notifier.expensesPrediction,
          ),
        ],
      );

  Widget _buildPeriodSelector(final ExpensesPredictionNotifier notifier) =>
      DropdownButton<Period>(
        value: notifier.currentPeriod,
        items: Period.values
            .map(
              (final period) => DropdownMenuItem(
                value: period,
                child: Text(period.toString().split('.').last),
              ),
            )
            .toList(),
        onChanged: (final newPeriod) {
          if (newPeriod != null) {
            notifier.changePeriod(newPeriod);
          }
        },
      );

  List<FlSpot> _getBudgetSpots(final ExpensesPredictionNotifier notifier) =>
      notifier.budgets
          .map((final budget) => FlSpot(
              budget.date.millisecondsSinceEpoch.toDouble(), budget.amount))
          .toList();

  List<FlSpot> _getExpenseSpots(final ExpensesPredictionNotifier notifier) =>
      notifier.expenses
          .map((final expense) => FlSpot(
              expense.date.millisecondsSinceEpoch.toDouble(), expense.amount))
          .toList();
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.title,
    required this.amount,
    required this.predictionType,
    super.key,
  });

  final String title;
  final double amount;
  final PredictionType predictionType;

  @override
  Widget build(final BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Text(title, style: Theme.of(context).textTheme.titleLarge),
              Text('\$${amount.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.headlineSmall),
              Icon(_getPredictionIcon(), color: _getPredictionColor()),
            ],
          ),
        ),
      );

  IconData _getPredictionIcon() {
    switch (predictionType) {
      case PredictionType.positive:
        return Icons.trending_up;
      case PredictionType.negative:
        return Icons.trending_down;
      case PredictionType.neutral:
        return Icons.trending_flat;
    }
  }

  Color _getPredictionColor() {
    switch (predictionType) {
      case PredictionType.positive:
        return Colors.green;
      case PredictionType.negative:
        return Colors.red;
      case PredictionType.neutral:
        return Colors.grey;
    }
  }
}
