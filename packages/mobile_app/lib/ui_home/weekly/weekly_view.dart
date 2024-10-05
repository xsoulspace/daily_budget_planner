import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_home/hooks/tab_controller_listener.dart';
import 'package:mobile_app/ui_home/weekly/weekly_cubit.dart';
import 'package:mobile_app/ui_home/widgets/copy_button.dart';

class WeeklyView extends StatefulHookWidget {
  const WeeklyView({super.key});

  @override
  State<WeeklyView> createState() => _WeeklyViewState();
}

class _WeeklyViewState extends State<WeeklyView>
    with AutomaticKeepAliveClientMixin {
  void _requestAmountFocus() {
    _requestAmountFocusByIndex(DefaultTabController.of(context).index);
  }

  void _requestAmountFocusByIndex(final int index) {
    if (index != 1) return;
    final monthlyCubit = context.read<WeeklyCubit>();
    unawaited(SoftKeyboard.open());
    monthlyCubit.amountFocusNode.requestFocus();
  }

  @override
  Widget build(final BuildContext context) {
    super.build(context);
    final weeklyCubit = context.watch<WeeklyCubit>();
    useTabControllerListenerState(
      onTabChanged: _requestAmountFocusByIndex,
    );
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        Gap(
          DeviceRuntimeType.isMobile ? 12 : 24,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(context.s.weeklyBudget),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          focusNode: weeklyCubit.amountFocusNode,
                          autofocus: true,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.number,
                          controller: weeklyCubit.amountController,
                          onChanged: weeklyCubit.onAmountChange,
                          decoration: const InputDecoration(filled: true),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          weeklyCubit.amountController.clear();
                          weeklyCubit.onAmountChange('');
                          _requestAmountFocus();
                        },
                        icon: const Icon(Icons.clear),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Gap(2),
            const SizedBox(
              height: 100,
              child: VerticalDivider(thickness: 2),
            ),
            const Gap(6),
            Flexible(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(context.s.dailyBudget),
                  Row(
                    children: [
                      Text(
                        weeklyCubit.dailyBudget,
                        style: context.textTheme.titleLarge,
                      ),
                      const Spacer(),
                      CopyButton(value: weeklyCubit.dailyBudget),
                    ],
                  ),
                  const Divider(),
                  const Gap(6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          context.s.daysLeftInWeek,
                          style: context.textTheme.bodyLarge,
                        ),
                      ),
                      const Gap(16),
                      Text(
                        weeklyCubit.daysLeft.toString(),
                        style: context.textTheme.titleLarge,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
