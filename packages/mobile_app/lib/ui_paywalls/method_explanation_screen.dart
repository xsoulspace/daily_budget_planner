import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// {@template method_explanation_screen}
/// A screen that explains the budgeting method used in the app.
/// {@endtemplate}
class MethodExplanationScreen extends StatelessWidget {
  /// {@macro method_explanation_screen}
  const MethodExplanationScreen({super.key});

  @override
  Widget build(final BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('How It Works'),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Quick Guide'),
                Tab(text: 'Story'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              _QuickGuideTab(),
              _StoryTab(),
            ],
          ),
        ),
      );
}

class _QuickGuideTab extends StatelessWidget {
  @override
  Widget build(final BuildContext context) => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Simple Budget Planning',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ).animate().fadeIn().slideX(),
            const SizedBox(height: 16),
            _ExplanationStep(
              step: 1,
              title: 'Enter your current balance',
              icon: Icons.account_balance_wallet,
            ),
            _ExplanationStep(
              step: 2,
              title: 'Add required expenses',
              icon: Icons.money_off,
            ),
            _ExplanationStep(
              step: 3,
              title: 'Set next salary date',
              icon: Icons.calendar_today,
            ),
            const SizedBox(height: 24),
            _ExampleCalculation(),
            const SizedBox(height: 24),
            const Text(
              "That's it! The app will calculate your daily budget.",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ).animate().fadeIn().slideX(),
            const SizedBox(height: 16),
            const Text(
              'Note: This is not financial advice, but we hope this method will be useful for you!',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      );
}

class _StoryTab extends StatelessWidget {
  @override
  Widget build(final BuildContext context) => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'The Journey to Simple Budgeting',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ).animate().fadeIn().slideX(),
            const SizedBox(height: 16),
            _StoryParagraph(
              'For years, I struggled to organize my finances. I tried tracking every single expense, but it was time-consuming and, honestly, a bit overwhelming. 😓',
            ),
            _StoryParagraph(
              "Then, I had a realization. Every day, I found myself asking the same question: 'How much can I spend today without breaking the bank?' 🤔",
            ),
            _StoryParagraph(
              "That's when it hit me - what if budgeting could be simpler? What if we focused on planning rather than constant tracking? 💡",
            ),
            _StoryParagraph(
              "So, I came up with this method. It's straightforward and takes just a few minutes:",
            ),
            _StoryStep(
              '1️⃣ Start with what you have. Enter your current balance.',
            ),
            _StoryStep(
              '2️⃣ Be realistic about your commitments. Add up your required expenses (rent, subscriptions, loan payments, etc.).',
            ),
            _StoryStep(
              '3️⃣ Look ahead. Set the date of your next expected income.',
            ),
            _StoryParagraph(
              "That's it! The app does the rest. It calculates how many days until your next payday, subtracts your expenses from your current balance, and divides what's left by the number of days. The result? Your daily budget! 🎉",
            ),
            _StoryParagraph(
              'Now, instead of stressing over every purchase, you have a clear, simple guide. You know exactly how much you can spend each day while still meeting your obligations.',
            ),
            _StoryParagraph(
              "Remember, this isn't financial advice - it's a tool. A tool that I hope will bring you the same peace of mind and financial clarity it's brought me. Happy budgeting! 😊",
            ),
          ],
        ),
      );
}

class _StoryParagraph extends StatelessWidget {
  const _StoryParagraph(this.text);

  final String text;

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ).animate().fadeIn().slideX();
}

class _StoryStep extends StatelessWidget {
  const _StoryStep(this.text);

  final String text;

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ).animate().fadeIn().slideX();
}

class _ExplanationStep extends StatelessWidget {
  const _ExplanationStep({
    required this.step,
    required this.title,
    required this.icon,
  });

  final int step;
  final String title;
  final IconData icon;

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            CircleAvatar(
              child: Text('$step'),
            ),
            const SizedBox(width: 16),
            Expanded(child: Text(title)),
            Icon(icon),
          ],
        ).animate().fadeIn().slideX(),
      );
}

class _ExampleCalculation extends StatelessWidget {
  @override
  Widget build(final BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Example Calculation',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              _CalcRow('Current Balance:', '350'),
              _CalcRow('Required Expenses:', '50'),
              _CalcRow('Days until next salary:', '30'),
              const Divider(),
              _CalcRow('Available Balance:', '300', bold: true),
              _CalcRow('Daily Budget:', '10', bold: true, color: Colors.green),
            ],
          ),
        ).animate().fadeIn().scale(),
      );
}

class _CalcRow extends StatelessWidget {
  const _CalcRow(this.label, this.value, {this.bold = false, this.color});

  final String label;
  final String value;
  final bool bold;
  final Color? color;

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label),
            Text(
              '\$$value',
              style: TextStyle(
                fontWeight: bold ? FontWeight.bold : FontWeight.normal,
                color: color,
              ),
            ),
          ],
        ),
      );
}
