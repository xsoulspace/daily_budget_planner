import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/ui_prediction/wip/expenses_prediction_graph.dart';
import 'package:mobile_app/ui_prediction/wip/expenses_prediction_notifier.dart';
import 'package:mobile_app/ui_prediction/wip/expensess_prediction_models.dart';
import 'package:mobile_app/ui_prediction/wip/regular_expense_input_form.dart';
import 'package:provider/provider.dart';

class ExpensesPredictionScreen extends StatelessWidget {
  const ExpensesPredictionScreen({super.key});
  static Future<void> show(final BuildContext context) async =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (final _) => const ExpensesPredictionScreen(),
        ),
      );
  @override
  Widget build(final BuildContext context) =>
      Consumer<ExpensesPredictionNotifier>(
        builder: (final context, final notifier, final child) => Scaffold(
          appBar: AppBar(title: const Text('Expenses Prediction')),
          body: SingleChildScrollView(
            child: Column(
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
                RegularExpenseInputForm(
                  onSubmit: notifier.addRegularExpense,
                ),
                ElevatedButton(
                  onPressed: () => _showRegularExpensesList(context, notifier),
                  child: const Text('View Regular Expenses'),
                ),
              ],
            ),
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
          .where(
            (final budget) =>
                budget.date.millisecondsSinceEpoch.isFinite &&
                budget.amount.isFinite,
          )
          .map(
            (final budget) => FlSpot(
              budget.date.millisecondsSinceEpoch.toDouble(),
              budget.amount,
            ),
          )
          .toList();

  List<FlSpot> _getExpenseSpots(final ExpensesPredictionNotifier notifier) =>
      notifier.expenses
          .where(
            (final expense) =>
                expense.date.millisecondsSinceEpoch.isFinite &&
                expense.amount.isFinite,
          )
          .map(
            (final expense) => FlSpot(
              expense.date.millisecondsSinceEpoch.toDouble(),
              expense.amount,
            ),
          )
          .toList();

  void _showRegularExpensesList(
    final BuildContext context,
    final ExpensesPredictionNotifier notifier,
  ) {
    unawaited(
      showDialog(
        context: context,
        builder: (final context) => AlertDialog(
          title: const Text('Regular Expenses'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: notifier.regularExpenses.length,
              itemBuilder: (final context, final index) {
                final expense = notifier.regularExpenses[index];
                return ListTile(
                  title: Text(expense.category),
                  subtitle: Text('${expense.amount} - ${expense.period}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      notifier.removeRegularExpense(expense);
                      Navigator.of(context).pop();
                    },
                  ),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
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
              Text(
                '\$${amount.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
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
