import 'package:daily_budget_planner/home/weekly/weekly_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:ui_kit/ui_kit.dart';

class WeeklyView extends StatefulWidget {
  const WeeklyView({super.key});

  @override
  State<WeeklyView> createState() => _WeeklyViewState();
}

class _WeeklyViewState extends State<WeeklyView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(final BuildContext context) {
    super.build(context);
    final weeklyCubit = context.watch<WeeklyCubit>();

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const TopSafeArea(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Weekly Budget'),
                    TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      controller: weeklyCubit.amountController,
                      onChanged: weeklyCubit.onAmountChange,
                    ),
                  ],
                ),
              ),
              const Gap(8),
              const SizedBox(
                height: 100,
                child: VerticalDivider(thickness: 2),
              ),
              const Gap(18),
              Flexible(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Daily Budget'),
                    Row(
                      children: [
                        Text(
                          weeklyCubit.dailyBudget,
                          style: context.textTheme.titleLarge,
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () async {
                            final messenger = ScaffoldMessenger.of(context);
                            await Clipboard.setData(
                              ClipboardData(text: weeklyCubit.dailyBudget),
                            );
                            messenger.showSnackBar(
                              SnackBar(
                                content: const Text('Copied'),
                                action: SnackBarAction(
                                  onPressed: messenger.hideCurrentSnackBar,
                                  label: 'Ok',
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.copy),
                        )
                      ],
                    ),
                    const Gap(12),
                    Row(
                      children: [
                        const Text('Days Left in week: '),
                        const Gap(16),
                        Text(weeklyCubit.daysLeft.toString()),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
