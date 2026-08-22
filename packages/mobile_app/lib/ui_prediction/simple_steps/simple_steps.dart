import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_prediction/upsert_budget_dialog.dart';

/// {@template simple_steps_flow}
/// A step-by-step onboarding flow for first-time users.
/// Displays a vertical carousel of steps to guide users through
/// the initial setup of the application.
/// {@endtemplate}
class SimpleStepsFlow extends HookWidget {
  /// {@macro simple_steps_flow}
  const SimpleStepsFlow({super.key});

  /// Shows the simple steps flow in a full-screen dialog.
  static Future<void> show(final BuildContext context) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) => const SimpleStepsFlow(),
        ),
      );

  @override
  Widget build(final BuildContext context) {
    final pageController = usePageController();
    final currentPage = useState(0);
    const stepsCount = 6;

    void onNext() {
      if (currentPage.value < stepsCount) {
        unawaited(
          pageController.animateToPage(
            currentPage.value + 1,
            duration: 400.milliseconds,
            curve: Curves.easeInOut,
          ),
        );
      } else {
        _completeOnboarding(context);
      }
    }

    Widget buildStep(final int index) => switch (index) {
      0 => _WelcomeStep(),
      1 => _SetupBudgetStep(onNext: onNext),
      2 => _DailyBudgetStep(),
      3 => _RegularIncomeStep(),
      4 => _RegularExpensesStep(),
      5 => _CompletionStep(),
      _ => const SizedBox.shrink(),
    };

    // Listen to page changes
    useEffect(() {
      void listener() {
        if (pageController.page != null) {
          currentPage.value = pageController.page!.round();
        }
      }

      pageController.addListener(listener);
      return () => pageController.removeListener(listener);
    }, [pageController]);

    return UiScaffold(
      body: ColoredBox(
        color: context.colorScheme.primary,
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 650, maxHeight: 650),
              child: Column(
                children: [
                  _buildHeader(
                    context: context,
                    currentStep: currentPage.value,
                    totalSteps: stepsCount,
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: pageController,
                      scrollDirection: Axis.vertical,
                      itemCount: stepsCount,
                      itemBuilder:
                          (final context, final index) => buildStep(index),
                    ),
                  ),
                  _buildFooter(
                    context: context,
                    currentStep: currentPage.value,
                    totalSteps: stepsCount,
                    onNext: onNext,
                    onSkip: () => _completeOnboarding(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader({
    required final BuildContext context,
    required final int currentStep,
    required final int totalSteps,
  }) => Padding(
    padding: const EdgeInsets.all(16),
    child: Row(
      children: [
        StepIndicator(currentStep: currentStep, totalSteps: totalSteps),
        const Spacer(),
        IconButton(
          icon: Icon(Icons.close, color: context.colorScheme.onPrimary),
          onPressed: () => _completeOnboarding(context),
        ),
      ],
    ),
  );

  Widget _buildFooter({
    required final BuildContext context,
    required final int currentStep,
    required final int totalSteps,
    required final VoidCallback onNext,
    required final VoidCallback onSkip,
  }) => Padding(
    padding: const EdgeInsets.all(16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (currentStep < totalSteps - 1)
          TextButton(
            onPressed: onSkip,
            child: Text(
              'Skip',
              style: TextStyle(color: context.colorScheme.onPrimary),
            ),
          )
        else
          const SizedBox.shrink(),
        UiTextButton(
          onPressed: onNext,
          title: Text(
            currentStep < totalSteps - 1 ? 'Next' : 'Get Started',
            style: TextStyle(color: context.colorScheme.onPrimary),
          ),
        ),
      ],
    ),
  );

  void _completeOnboarding(final BuildContext context) {
    // TODO: Save onboarding completion status
    Navigator.of(context).pop();
  }
}

/// A widget that displays the current step progress.
class StepIndicator extends StatelessWidget {
  /// Creates a step indicator.
  const StepIndicator({
    required this.currentStep,
    required this.totalSteps,
    super.key,
  });

  /// The current step index.
  final int currentStep;

  /// The total number of steps.
  final int totalSteps;

  @override
  Widget build(final BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Step ${currentStep + 1} of $totalSteps',
        style: context.textTheme.labelMedium?.copyWith(
          color: context.colorScheme.onPrimary,
        ),
      ),
      const Gap(8),
      Row(
        children: List.generate(
          totalSteps,
          (final index) => Container(
            width: 24,
            height: 4,
            margin: const EdgeInsets.only(right: 4),
            decoration: BoxDecoration(
              color:
                  index <= currentStep
                      ? context.colorScheme.onPrimary
                      : context.colorScheme.onPrimary.withOpacity(0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
      ),
    ],
  );
}

/// Base class for step content.
class StepContent extends StatelessWidget {
  /// Creates step content.
  const StepContent({
    required this.title,
    required this.description,
    required this.icon,
    this.action,
    super.key,
  });

  /// The step title.
  final String title;

  /// The step description.
  final String description;

  /// The step icon.
  final IconData icon;

  /// Optional action widget to display.
  final Widget? action;

  @override
  Widget build(final BuildContext context) => Container(
    margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: context.colorScheme.surface,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 64, color: context.colorScheme.primary),
        const Gap(24),
        Text(
          title,
          style: context.textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        const Gap(16),
        Text(
          description,
          style: context.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        if (action != null) ...[const Gap(24), action!],
      ],
    ),
  );
}

class _WelcomeStep extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    return StepContent(
      title: LocalizedMap(
        {
          languages.en: 'Welcome to Daily Budget Planner',
          languages.it: 'Benvenuto nel Pianificatore di Budget Giornaliero',
          languages.ru: 'Добро пожаловать в Планировщик дневного бюджета',
        },
      ).getValue(locale),
      description: LocalizedMap(
        {
          languages.en:
              'This app helps you manage your finances by calculating how much you can spend each day based on your budget and regular expenses.',
          languages.it:
              'Questa app ti aiuta a gestire le tue finanze calcolando quanto puoi spendere ogni giorno in base al tuo budget e alle spese regolari.',
          languages.ru:
              'Это приложение помогает управлять финансами, рассчитывая, сколько вы можете тратить каждый день на основе вашего бюджета и регулярных расходов.',
        },
      ).getValue(locale),
      icon: Icons.wallet,
    );
  }
}

class _SetupBudgetStep extends HookWidget {
  const _SetupBudgetStep({required this.onNext, super.key});

  final VoidCallback onNext;

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    final upsertBudgetHook = useUpsertBudget(
      context: context,
      shouldPopOnSave: false,
    );
    return StepContent(
      title: LocalizedMap(
        {
          languages.en: 'Set Your Initial Budget',
          languages.it: 'Imposta il tuo Budget Iniziale',
          languages.ru: 'Установите начальный бюджет',
        },
      ).getValue(locale),
      description: LocalizedMap(
        {
          languages.en:
              'Start by entering how much money you have available to spend. This will be your starting budget.',
          languages.it:
              'Inizia inserendo quanto denaro hai a disposizione. Questo sarà il tuo budget iniziale.',
          languages.ru:
              'Начните с ввода суммы денег, которую вы можете потратить. Это будет ваш начальный бюджет.',
        },
      ).getValue(locale),
      icon: Icons.account_balance_wallet,
      action: Column(
        children: [
          UpsertBudgetForm(upsertBudget: upsertBudgetHook),
          UiTextButton(
            onPressed: () async {
              final success = await upsertBudgetHook.onSave();
              if (success) onNext();
            },
            title: Text(
              LocalizedMap(
        {
                  languages.en: 'Set Budget',
                  languages.it: 'Imposta Budget',
                  languages.ru: 'Установить бюджет',
                },
              ).getValue(locale),
            ),
          ),
        ],
      ),
    );
  }
}

class _DailyBudgetStep extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    final configPeriodSelector = useConfigPeriodSelector(context: context);
    return StepContent(
      title: LocalizedMap(
        {
          languages.en: 'Understanding Daily Budget',
          languages.it: 'Comprendere il Budget Giornaliero',
          languages.ru: 'Понимание дневного бюджета',
        },
      ).getValue(locale),
      description: LocalizedMap(
        {
          languages.en:
              'Your daily budget is calculated by dividing your remaining budget by the number of days in your selected period. This tells you how much you can spend today to stay on track.',
          languages.it:
              'Il tuo budget giornaliero è calcolato dividendo il budget rimanente per il numero di giorni nel periodo selezionato. Questo ti dice quanto puoi spendere oggi per rimanere in linea.',
          languages.ru:
              'Ваш дневной бюджет рассчитывается путем деления оставшегося бюджета на количество дней в выбранном периоде. Это показывает, сколько вы можете потратить сегодня, чтобы оставаться в рамках плана.',
        },
      ).getValue(locale),
      icon: Icons.calendar_today,
      action: Column(
        children: [
          Row(
            children: [
              Text(
                LocalizedMap(
        {
                    languages.en: 'Start Period Date: ',
                    languages.it: 'Data di inizio periodo: ',
                    languages.ru: 'Дата начала периода: ',
                  },
                ).getValue(locale),
              ),
              TextButton(
                onPressed: () {}, // () async => _selectDateTime(context),
                child: const Text(
                  'Today',
                ), //  DateFormat.yMMMd().format(_selectedDate)),
              ),
            ],
          ),
          PeriodSelectorButton(
            period: configPeriodSelector.period,
            onPeriodSelected: configPeriodSelector.onPeriodSelected,
          ),
        ],
      ),
    );
  }
}

class _RegularIncomeStep extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    return StepContent(
      title: LocalizedMap(
        {
          languages.en: 'Add Regular Income',
          languages.it: 'Aggiungi Entrate Regolari',
          languages.ru: 'Добавьте регулярный доход',
        },
      ).getValue(locale),
      description: LocalizedMap(
        {
          languages.en:
              'Add your regular sources of income, such as salary or allowance. The app will factor these in when calculating your daily budget.',
          languages.it:
              "Aggiungi le tue fonti di reddito regolari, come stipendio o indennità. L'app le considererà nel calcolo del tuo budget giornaliero.",
          languages.ru:
              'Добавьте регулярные источники дохода, такие как зарплата или пособие. Приложение учтет их при расчете вашего дневного бюджета.',
        },
      ).getValue(locale),
      icon: Icons.trending_up,
      action: UiTextButton(
        onPressed: () async => showIncomesTasksView(context: context),
        title: Text(
          LocalizedMap(
        {
              languages.en: 'Add Income',
              languages.it: 'Aggiungi Entrate',
              languages.ru: 'Добавить доход',
            },
          ).getValue(locale),
        ),
      ),
    );
  }
}

class _RegularExpensesStep extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    return StepContent(
      title: LocalizedMap(
        {
          languages.en: 'Add Regular Expenses',
          languages.it: 'Aggiungi Spese Regolari',
          languages.ru: 'Добавьте регулярные расходы',
        },
      ).getValue(locale),
      description: LocalizedMap(
        {
          languages.en:
              'Add your recurring expenses like rent, utilities, or subscriptions. These will be automatically deducted from your budget.',
          languages.it:
              'Aggiungi le tue spese ricorrenti come affitto, utenze o abbonamenti. Questi saranno automaticamente detratti dal tuo budget.',
          languages.ru:
              'Добавьте повторяющиеся расходы, такие как аренда, коммунальные услуги или подписки. Они будут автоматически вычитаться из вашего бюджета.',
        },
      ).getValue(locale),
      icon: Icons.trending_down,
      action: UiTextButton(
        onPressed: () async => showExpensesTasksView(context: context),
        title: Text(
          LocalizedMap(
        {
              languages.en: 'Add Expenses',
              languages.it: 'Aggiungi Spese',
              languages.ru: 'Добавить расходы',
            },
          ).getValue(locale),
        ),
      ),
    );
  }
}

class _CompletionStep extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    return StepContent(
      title: LocalizedMap(
        {
          languages.en: "You're All Set!",
          languages.it: 'Sei Pronto!',
          languages.ru: 'Всё готово!',
        },
      ).getValue(locale),
      description: LocalizedMap(
        {
          languages.en:
              "You've completed the setup. Now you can start tracking your daily spending and stay on budget. Remember to record your expenses and income regularly for the best results.",
          languages.it:
              'Hai completato la configurazione. Ora puoi iniziare a monitorare le tue spese giornaliere e rimanere nel budget. Ricorda di registrare regolarmente le tue spese e entrate per i migliori risultati.',
          languages.ru:
              'Вы завершили настройку. Теперь вы можете начать отслеживать свои ежедневные расходы и оставаться в рамках бюджета. Не забывайте регулярно записывать свои расходы и доходы для достижения наилучших результатов.',
        },
      ).getValue(locale),
      icon: Icons.check_circle,
    );
  }
}
