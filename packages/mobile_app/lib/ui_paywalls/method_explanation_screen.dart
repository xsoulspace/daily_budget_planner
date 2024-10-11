import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';

/// {@template method_explanation_screen}
/// An interactive screen that guides users through the budgeting method.
/// {@endtemplate}
class MethodExplanationScreen extends StatefulWidget {
  /// {@macro method_explanation_screen}
  const MethodExplanationScreen({super.key});

  @override
  State<MethodExplanationScreen> createState() =>
      _MethodExplanationScreenState();
}

class _MethodExplanationScreenState extends State<MethodExplanationScreen> {
  final PageController _pageController = PageController();
  double? currentBalance;
  double? expenses;
  DateTime? nextSalaryDate;
  double? dailyBudget;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_pageController.page! < 3) {
      unawaited(
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        ),
      );
    }
  }

  void _calculateDailyBudget() {
    if (currentBalance != null && expenses != null && nextSalaryDate != null) {
      final availableBalance = currentBalance! - expenses!;
      final daysUntilSalary =
          nextSalaryDate!.difference(DateTime.now()).inDays + 1;
      setState(() {
        dailyBudget = availableBalance / daysUntilSalary;
      });
    }
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Learn the Magic of Budgeting')),
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            _BalancePage(
              onNext: (final value) {
                setState(() => currentBalance = value);
                _nextPage();
              },
            ),
            _ExpensesPage(
              onNext: (final value) {
                setState(() => expenses = value);
                _nextPage();
              },
            ),
            _SalaryDatePage(
              onNext: (final value) {
                setState(() => nextSalaryDate = value);
                _calculateDailyBudget();
                _nextPage();
              },
            ),
            _ResultPage(
              currentBalance: currentBalance,
              expenses: expenses,
              nextSalaryDate: nextSalaryDate,
              dailyBudget: dailyBudget,
            ),
          ],
        ),
      );
}

class _BalancePage extends StatelessWidget {
  const _BalancePage({required this.onNext});

  final void Function(double) onNext;

  @override
  Widget build(final BuildContext context) {
    final controller = TextEditingController();
    return _GuidePage(
      title: "What's in Your Pocket?",
      description:
          "Let's start with how much money you have right now. Don't worry, we won't tell anyone! 🤫",
      content: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          prefixText: r'$',
          hintText: 'Enter your current balance',
        ),
      ),
      onNext: () {
        final value = double.tryParse(controller.text);
        if (value != null && value > 0) {
          onNext(value);
        }
      },
    );
  }
}

class _ExpensesPage extends StatelessWidget {
  const _ExpensesPage({required this.onNext});

  final void Function(double) onNext;

  @override
  Widget build(final BuildContext context) {
    final controller = TextEditingController();
    return _GuidePage(
      title: 'Time for Some Adulting',
      description:
          "Now, let's add up all the boring stuff you need to pay for. Think rent, subscriptions, loan payments - you know, the essentials. 💸",
      content: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          prefixText: r'$',
          hintText: 'Enter your total expenses',
        ),
      ),
      onNext: () {
        final value = double.tryParse(controller.text);
        if (value != null && value >= 0) {
          onNext(value);
        }
      },
    );
  }
}

class _SalaryDatePage extends StatelessWidget {
  const _SalaryDatePage({required this.onNext});

  final void Function(DateTime) onNext;

  @override
  Widget build(final BuildContext context) {
    DateTime? selectedDate;
    return _GuidePage(
      title: 'When Does the Money Train Arrive?',
      description:
          "Last step! When's your next payday? This helps us figure out how long your money needs to last. 🗓️",
      content: ElevatedButton(
        child: Text(
          selectedDate == null
              ? 'Select Next Salary Date'
              : DateFormat('MMM d, y').format(selectedDate),
        ),
        onPressed: () async {
          final date = await showDatePicker(
            context: context,
            initialDate: DateTime.now().add(const Duration(days: 30)),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 365)),
          );
          if (date != null) {
            selectedDate = date;
            onNext(date);
          }
        },
      ),
      onNext: () {
        if (selectedDate != null) {
          onNext(selectedDate!);
        }
      },
    );
  }
}

class _ResultPage extends StatelessWidget {
  const _ResultPage({
    required this.currentBalance,
    required this.expenses,
    required this.nextSalaryDate,
    required this.dailyBudget,
  });

  final double? currentBalance;
  final double? expenses;
  final DateTime? nextSalaryDate;
  final double? dailyBudget;

  @override
  Widget build(final BuildContext context) => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '🎉 Congratulations!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ).animate().fadeIn().slideX(),
            const SizedBox(height: 16),
            Text(
              "You've just mastered the art of simple budgeting! Here's your financial snapshot:",
              style: Theme.of(context).textTheme.bodyLarge,
            ).animate().fadeIn().slideX(),
            const SizedBox(height: 24),
            _ResultCard(
              currentBalance: currentBalance,
              expenses: expenses,
              nextSalaryDate: nextSalaryDate,
              dailyBudget: dailyBudget,
            ),
            const SizedBox(height: 24),
            Text(
              "Now you know exactly how much you can spend each day without breaking the bank. Remember, this is a tool - some days you might spend less, others a bit more. The key is to stay aware and make informed choices. You've got this! 💪",
              style: Theme.of(context).textTheme.bodyLarge,
            ).animate().fadeIn().slideX(),
          ],
        ),
      );
}

class _ResultCard extends StatelessWidget {
  const _ResultCard({
    required this.currentBalance,
    required this.expenses,
    required this.nextSalaryDate,
    required this.dailyBudget,
  });

  final double? currentBalance;
  final double? expenses;
  final DateTime? nextSalaryDate;
  final double? dailyBudget;

  @override
  Widget build(final BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ResultRow(
                'Current Balance:',
                '\$${currentBalance?.toStringAsFixed(2)}',
              ),
              _ResultRow(
                'Required Expenses:',
                '\$${expenses?.toStringAsFixed(2)}',
              ),
              _ResultRow(
                'Next Salary Date:',
                DateFormat('MMM d, y').format(nextSalaryDate!),
              ),
              const Divider(),
              _ResultRow(
                'Your Daily Budget:',
                '\$${dailyBudget?.toStringAsFixed(2)}',
                isHighlighted: true,
              ),
            ],
          ),
        ),
      ).animate().fadeIn().scale();
}

class _ResultRow extends StatelessWidget {
  const _ResultRow(this.label, this.value, {this.isHighlighted = false});

  final String label;
  final String value;
  final bool isHighlighted;

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
                color: isHighlighted
                    ? Theme.of(context).colorScheme.primary
                    : null,
              ),
            ),
          ],
        ),
      );
}

class _GuidePage extends StatelessWidget {
  const _GuidePage({
    required this.title,
    required this.description,
    required this.content,
    required this.onNext,
  });

  final String title;
  final String description;
  final Widget content;
  final VoidCallback onNext;

  @override
  Widget build(final BuildContext context) => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ).animate().fadeIn().slideX(),
            const SizedBox(height: 16),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyLarge,
            ).animate().fadeIn().slideX(),
            const SizedBox(height: 24),
            content.animate().fadeIn().scale(),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: onNext,
              child: const Text('Next'),
            ).animate().fadeIn().slideX(),
          ],
        ),
      );
}
