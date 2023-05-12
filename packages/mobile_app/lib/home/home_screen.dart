import 'package:daily_buget_planner/home/monthly/monthly_cubit.dart';
import 'package:daily_buget_planner/home/monthly/monthly_view.dart';
import 'package:daily_buget_planner/home/weekly/weekly_cubit.dart';
import 'package:daily_buget_planner/home/weekly/weekly_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(final BuildContext context) => DefaultTabController(
        length: 2,
        child: _HomeScreenProvider(
          builder: (final context) => const HomeScreenBody(),
        ),
      );
}

class _HomeScreenProvider extends StatelessWidget {
  const _HomeScreenProvider({
    required this.builder,
  });
  final WidgetBuilder builder;
  @override
  Widget build(final BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (final context) => WeeklyCubit()),
          BlocProvider(create: (final context) => MonthlyCubit())
        ],
        child: Builder(builder: builder),
      );
}

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: Column(
          children: [
            const Expanded(
              child: TabBarView(
                children: [
                  WeeklyView(),
                  MonthlyView(),
                ],
              ),
            ),
            TabBar(
              tabs: [
                FilledButton.tonalIcon(
                  onPressed: () =>
                      DefaultTabController.of(context).animateTo(0),
                  icon: const Icon(Icons.view_week_rounded),
                  label: const Text('Weekly'),
                ),
                FilledButton.tonalIcon(
                  onPressed: () =>
                      DefaultTabController.of(context).animateTo(1),
                  icon: const Icon(Icons.calendar_month_rounded),
                  label: const Text('Montly'),
                ),
              ],
            ),
          ],
        ),
      );
}
