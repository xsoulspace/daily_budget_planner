import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/home/monthly/monthly_cubit.dart';
import 'package:mobile_app/home/monthly/monthly_view.dart';
import 'package:mobile_app/home/weekly/weekly_cubit.dart';
import 'package:mobile_app/home/weekly/weekly_view.dart';
import 'package:ui_kit/ui_kit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          BlocProvider(
            create: (final context) => WeeklyCubit(
              dto: WeeklyCubitDto(context: context),
            ),
          ),
          BlocProvider(
            create: (final context) => MonthlyCubit(
              dto: MonthlyCubitDto(context: context),
            ),
          )
        ],
        child: Builder(builder: builder),
      );
}

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(final BuildContext context) => const Scaffold(
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  MonthlyView(),
                  WeeklyView(),
                ],
              ),
            ),
            TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.calendar_month_rounded),
                  text: 'Monthly',
                ),
                Tab(
                  icon: Icon(Icons.view_week_rounded),
                  text: 'Weekly',
                ),
              ],
            ),
            BottomSafeArea()
          ],
        ),
      );
}
