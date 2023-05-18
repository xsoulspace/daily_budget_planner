import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:gap/gap.dart';
import 'package:mobile_app/home/monthly/monthly_cubit.dart';
import 'package:mobile_app/home/monthly/monthly_view.dart';
import 'package:mobile_app/home/settings/settings_icon_button.dart';
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
  Widget build(final BuildContext context) => Portal(
        child: MultiBlocProvider(
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
        ),
      );
}

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: Column(
          children: [
            const HomeScreenTopBanner(),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 24, horizontal: 18),
                child: TabBarView(
                  children: [
                    MonthlyView(),
                    WeeklyView(),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TabBar(
                    padding: EdgeInsets.zero,
                    labelPadding: EdgeInsets.zero,
                    tabs: [
                      UiTab(
                        iconData: Icons.calendar_month_rounded,
                        label: context.s.monthly,
                      ),
                      UiTab(
                        iconData: Icons.view_week_rounded,
                        label: context.s.weekly,
                      ),
                    ],
                  ),
                ),
                const SettingsIconButton(),
              ],
            ),
            const BottomSafeArea()
          ],
        ),
      );
}

class UiTab extends StatelessWidget {
  const UiTab({
    required this.label,
    required this.iconData,
    super.key,
  });
  final String label;
  final IconData iconData;
  @override
  Widget build(final BuildContext context) => Tab(
        height: 32,
        iconMargin: EdgeInsets.zero,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(iconData),
            const Gap(4),
            Text(label),
          ],
        ),
      );
}
