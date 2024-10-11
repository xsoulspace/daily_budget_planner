import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_home/hooks/use_tab_controller_listener.dart';
import 'package:mobile_app/ui_home/monthly/monthly_cubit.dart';
import 'package:mobile_app/ui_home/widgets/widgets.dart';

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
    unawaited(SoftKeyboard.open());
    monthlyCubit.savingsFocusNode.requestFocus();
  }

  void _requestAmountFocusByIndex(final int index) {
    if (index != 0) return;
    final monthlyCubit = context.read<MonthlyCubit>();
    unawaited(SoftKeyboard.open());
    monthlyCubit.amountFocusNode.requestFocus();
  }

  @override
  Widget build(final BuildContext context) {
    super.build(context);
    final monthlyCubit = context.watch<MonthlyCubit>();
    final locale = useLocale(context);
    useTabControllerListenerState(
      onTabChanged: _requestAmountFocusByIndex,
    );

    final isLandscape = MediaQuery.of(context).size.width > 600;

    return Form(
      child: isLandscape
          ? _buildLandscapeLayout(context, monthlyCubit, locale)
          : _buildMobileLayout(context, monthlyCubit, locale),
    );
  }

  Widget _buildLandscapeLayout(
    final BuildContext context,
    final MonthlyCubit monthlyCubit,
    final Locale locale,
  ) =>
      ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: _buildInputSection(context, monthlyCubit, locale),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: _buildResultsSection(context, monthlyCubit, locale),
                  ),
                ),
              ),
            ],
          ),
        ],
      );

  Widget _buildMobileLayout(
    final BuildContext context,
    final MonthlyCubit monthlyCubit,
    final Locale locale,
  ) =>
      ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        children: [
          _buildInputSection(context, monthlyCubit, locale),
          const SizedBox(height: 16),
          _buildResultsSection(context, monthlyCubit, locale),
        ],
      );

  Widget _buildInputSection(
    final BuildContext context,
    final MonthlyCubit monthlyCubit,
    final Locale locale,
  ) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocalizedMap(
              value: {
                languages.en: 'Your Budget',
                languages.ru: 'Ваш бюджет',
                languages.it: 'Il tuo budget',
              },
            ).getValue(locale),
            style: context.textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          _buildInputField(
            label: LocalizedMap(
              value: {
                languages.en: 'Monthly Income',
                languages.ru: 'Ежемесячный доход',
                languages.it: 'Reddito mensile',
              },
            ).getValue(locale),
            controller: monthlyCubit.amountController,
            focusNode: monthlyCubit.amountFocusNode,
            onChanged: monthlyCubit.onAmountChange,
            onEditingComplete: _requestSavingsFocus,
            icon: Icons.attach_money,
          ),
          const SizedBox(height: 8),
          _buildInputField(
            label: LocalizedMap(
              value: {
                languages.en: 'Extra Costs/Savings',
                languages.ru: 'Доп. расходы/сбережения',
                languages.it: 'Costi extra/risparmi',
              },
            ).getValue(locale),
            controller: monthlyCubit.savingsController,
            focusNode: monthlyCubit.savingsFocusNode,
            onChanged: monthlyCubit.onSavingsChange,
            onEditingComplete: _requestAmountFocus,
            icon: Icons.savings,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.calendar_today, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: TextButton(
                  onPressed: () async =>
                      monthlyCubit.onChangeNextBudgetDay(context),
                  child: Text(
                    LocalizedMap(
                          value: {
                            languages.en: 'Next Budget Date: ',
                            languages.ru: 'Следующая дата бюджета: ',
                            languages.it: 'Prossima data di budget: ',
                          },
                        ).getValue(locale) +
                        (monthlyCubit.budget.nextBudgetDay?.formatDdMmYyyy() ??
                            LocalizedMap(
                              value: {
                                languages.en: 'Choose Date',
                                languages.ru: 'Выберите дату',
                                languages.it: 'Scegli la data',
                              },
                            ).getValue(locale)),
                    style: context.textTheme.bodyMedium,
                  ),
                ),
              ),
            ],
          ),
        ],
      );

  Widget _buildInputField({
    required final String label,
    required final TextEditingController controller,
    required final FocusNode focusNode,
    required final Function(String) onChanged,
    required final VoidCallback onEditingComplete,
    required final IconData icon,
  }) =>
      Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              controller: controller,
              focusNode: focusNode,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              onChanged: onChanged,
              onEditingComplete: onEditingComplete,
              decoration: InputDecoration(
                labelText: label,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                isDense: true,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear, size: 18),
                  onPressed: () {
                    controller.clear();
                    onChanged('');
                    focusNode.requestFocus();
                  },
                ),
              ),
            ),
          ),
        ],
      );

  Widget _buildResultsSection(
    final BuildContext context,
    final MonthlyCubit monthlyCubit,
    final Locale locale,
  ) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocalizedMap(
              value: {
                languages.en: 'Budget Breakdown',
                languages.ru: 'Разбивка бюджета',
                languages.it: 'Ripartizione del budget',
              },
            ).getValue(locale),
            style: context.textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          _buildBudgetItem(
            label: LocalizedMap(
              value: {
                languages.en: 'Daily Budget',
                languages.ru: 'Дневной бюджет',
                languages.it: 'Budget giornaliero',
              },
            ).getValue(locale),
            value: monthlyCubit.dailyBudget,
            icon: Icons.today,
          ),
          _buildBudgetItem(
            label: LocalizedMap(
              value: {
                languages.en: 'Weekly Budget',
                languages.ru: 'Недельный бюджет',
                languages.it: 'Budget settimanale',
              },
            ).getValue(locale),
            value: monthlyCubit.weeklyBudget,
            icon: Icons.view_week,
            subtitle: LocalizedMap(
              value: {
                languages.en: 'Can be less if < 7 days',
                languages.ru: 'Может быть меньше, если < 7 дней',
                languages.it: 'Può essere meno se < 7 giorni',
              },
            ).getValue(locale),
          ),
          _buildBudgetItem(
            label: LocalizedMap(
              value: {
                languages.en: 'Days in Total',
                languages.ru: 'Всего дней',
                languages.it: 'Giorni in totale',
              },
            ).getValue(locale),
            value: monthlyCubit.daysCount.toString(),
            icon: Icons.date_range,
          ),
        ],
      );

  Widget _buildBudgetItem({
    required final String label,
    required final String value,
    required final IconData icon,
    final String? subtitle,
  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Icon(icon, size: 20, color: context.theme.primaryColor),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: context.textTheme.bodyMedium),
                  if (subtitle != null)
                    Text(
                      subtitle,
                      style: context.textTheme.bodySmall,
                    ),
                ],
              ),
            ),
            Text(
              value,
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.theme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ).animate(
              key: ValueKey(value),
              effects: [
                FadeEffect(duration: 300.ms),
                ScaleEffect(duration: 300.ms),
              ],
            ),
            const SizedBox(width: 4),
            CopyButton(value: value),
          ],
        ),
      );

  @override
  bool get wantKeepAlive => true;
}
