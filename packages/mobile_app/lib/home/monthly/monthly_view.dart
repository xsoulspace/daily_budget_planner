import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:mobile_app/home/hooks/tab_controller_listener.dart';
import 'package:mobile_app/home/monthly/monthly_cubit.dart';
import 'package:mobile_app/home/widgets/copy_button.dart';
import 'package:ui_kit/ui_kit.dart';

class MonthlyView extends StatefulHookWidget {
  const MonthlyView({super.key});

  @override
  State<MonthlyView> createState() => _MonthlyViewState();
}

class _MonthlyViewState extends State<MonthlyView>
    with AutomaticKeepAliveClientMixin {
  void _requestAmountFocus() {
    _requestAmountFocusByIndex(DefaultTabController.of(context).index);
  }

  void _requestSavingsFocus() {
    final monthlyCubit = context.read<MonthlyCubit>();
    monthlyCubit.savingsFocusNode.requestFocus();
    unawaited(SoftKeyboard.open());
  }

  void _requestAmountFocusByIndex(final int index) {
    if (index != 0) return;
    final monthlyCubit = context.read<MonthlyCubit>();
    monthlyCubit.amountFocusNode.requestFocus();
    unawaited(SoftKeyboard.open());
  }

  @override
  Widget build(final BuildContext context) {
    super.build(context);
    final monthlyCubit = context.watch<MonthlyCubit>();
    useTabControllerListenerState(
      onTabChanged: _requestAmountFocusByIndex,
    );
    return Form(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
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
                    Text(context.s.yourBudget),
                    const Gap(12),
                    TextFormField(
                      autofocus: true,
                      focusNode: monthlyCubit.amountFocusNode,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      controller: monthlyCubit.amountController,
                      onChanged: monthlyCubit.onAmountChange,
                      onEditingComplete: _requestSavingsFocus,
                      onFieldSubmitted: (final value) => _requestSavingsFocus(),
                      decoration: const InputDecoration(filled: true),
                    ),
                    const Gap(12),
                    Text(context.s.extraCostsOrSaving),
                    Text(
                      context.s.willBeSubstructedFromYourBudget,
                      style: context.textTheme.labelMedium,
                    ),
                    const Gap(12),
                    TextFormField(
                      focusNode: monthlyCubit.savingsFocusNode,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.previous,
                      onEditingComplete: _requestAmountFocus,
                      onFieldSubmitted: (final value) => _requestAmountFocus(),
                      controller: monthlyCubit.savingsController,
                      onChanged: monthlyCubit.onSavingsChange,
                      decoration: const InputDecoration(filled: true),
                    ),
                    const Gap(16),
                    Text(context.s.nextBudgetDay),
                    const Gap(4),
                    TextButton(
                      onPressed: () async =>
                          monthlyCubit.onChangeNextBudgetDay(context),
                      child: Text(
                        monthlyCubit.state.budget.nextBudgetDay
                                ?.formatDdMmYyyy() ??
                            context.s.chooseDate,
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
                    Text(context.s.dailyBudget),
                    Row(
                      children: [
                        Text(
                          monthlyCubit.dailyBudget,
                          style: context.textTheme.titleLarge,
                        ),
                        const Spacer(),
                        CopyButton(value: monthlyCubit.dailyBudget),
                      ],
                    ),
                    const Gap(12),
                    const Divider(),
                    const Gap(12),
                    Text(context.s.weeklyBudget),
                    Text(
                      context.s.canBeLessIfYouHaveLessThan7Days,
                      style: context.textTheme.labelMedium,
                    ),
                    Row(
                      children: [
                        Text(
                          monthlyCubit.weeklyBudget,
                          style: context.textTheme.titleLarge,
                        ),
                        const Spacer(),
                        CopyButton(value: monthlyCubit.weeklyBudget),
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
                    const Gap(24),
                    // Row(
                    //   children: [
                    //     const Text('Days Left this week: '),
                    //     const Gap(4),
                    //     Text(monthlyCubit.daysLeftThisWeek.toString()),
                    //   ],
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          context.s.daysInTotal,
                          style: context.textTheme.bodyLarge,
                        ),
                        Text(
                          monthlyCubit.daysCount.toString(),
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
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
