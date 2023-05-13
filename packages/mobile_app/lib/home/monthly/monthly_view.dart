import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mobile_app/home/monthly/monthly_cubit.dart';
import 'package:ui_kit/ui_kit.dart';

class MonthlyView extends StatefulWidget {
  const MonthlyView({super.key});

  @override
  State<MonthlyView> createState() => _MonthlyViewState();
}

class _MonthlyViewState extends State<MonthlyView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(final BuildContext context) {
    super.build(context);
    final monthlyCubit = context.watch<MonthlyCubit>();

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
                    const Text('Your Budget'),
                    const Gap(12),
                    TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      controller: monthlyCubit.amountController,
                      onChanged: monthlyCubit.onAmountChange,
                      decoration: const InputDecoration(filled: true),
                    ),
                    const Gap(48),
                    const Text('Next Budget Day'),
                    const Gap(4),
                    TextButton(
                      onPressed: () async =>
                          monthlyCubit.onChangeNextBudgetDay(context),
                      child: Text(
                        monthlyCubit.state.budget.nextBudgetDay
                                ?.formatDdMmYyyy() ??
                            'Choose date',
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(8),
              const SizedBox(
                height: 220,
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
                          monthlyCubit.dailyBudget,
                          style: context.textTheme.titleLarge,
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () async {
                            final messenger = ScaffoldMessenger.of(context);
                            await Clipboard.setData(
                              ClipboardData(text: monthlyCubit.dailyBudget),
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
                    const Divider(),
                    const Gap(12),
                    const Text('Weekly Budget (7 days or less)'),
                    Row(
                      children: [
                        Text(
                          monthlyCubit.weeklyBudget,
                          style: context.textTheme.titleLarge,
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () async {
                            final messenger = ScaffoldMessenger.of(context);
                            await Clipboard.setData(
                              ClipboardData(
                                text: monthlyCubit.weeklyBudget,
                              ),
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
                    // const Gap(12),
                    // const Text('This week Budget ( days)'),
                    // Row(
                    //   children: [
                    //     Text(
                    //       '${monthlyCubit.thisWeekBudget}',
                    //       style: context.textTheme.titleLarge,
                    //     ),
                    //     const Spacer(),
                    //     IconButton(
                    //       onPressed: () async {
                    //         final messenger = ScaffoldMessenger.of(context);
                    //         await Clipboard.setData(
                    //           ClipboardData(
                    //             text: '${monthlyCubit.thisWeekBudget}',
                    //           ),
                    //         );
                    //         messenger.showSnackBar(
                    //           SnackBar(
                    //             content: const Text('Copied'),
                    //             action: SnackBarAction(
                    //               onPressed: messenger.hideCurrentSnackBar,
                    //               label: 'Ok',
                    //             ),
                    //           ),
                    //         );
                    //       },
                    //       icon: const Icon(Icons.copy),
                    //     )
                    //   ],
                    // ),
                    const Gap(12),
                    const Divider(),
                    const Gap(12),
                    // Row(
                    //   children: [
                    //     const Text('Days Left this week: '),
                    //     const Gap(4),
                    //     Text(monthlyCubit.daysLeftThisWeek.toString()),
                    //   ],
                    // ),
                    Row(
                      children: [
                        const Text('Days in total: '),
                        const Gap(4),
                        Text(monthlyCubit.daysCount.toString()),
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
