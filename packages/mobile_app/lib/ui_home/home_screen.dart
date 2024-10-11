import 'package:flutter_portal/flutter_portal.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_home/monthly/monthly_view.dart';
import 'package:mobile_app/ui_home/settings/settings_icon_button.dart';
import 'package:mobile_app/ui_home/weekly/weekly_view.dart';

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
        child: Builder(builder: builder),
      );
}

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: Column(
          children: [
            const UiSafeArea.top(),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 18, right: 18),
                child: TabBarView(
                  children: [
                    MonthlyView(),
                    WeeklyView(),
                  ],
                ),
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 350),
              child: Row(
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
            ),
            const UiSafeArea.bottom(),
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
