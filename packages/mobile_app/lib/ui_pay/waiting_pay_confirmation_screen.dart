import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_pay/paywall_flow.dart';

/// {@template waiting_pay_confirmation_screen}
/// Screen displayed when user's subscription payment is pending confirmation.
/// Provides clear feedback about payment status and what to expect.
/// {@endtemplate}
class WaitingPayConfirmationScreen extends StatefulWidget {
  /// {@macro waiting_pay_confirmation_screen}
  const WaitingPayConfirmationScreen({super.key});

  @override
  State<WaitingPayConfirmationScreen> createState() =>
      _WaitingPayConfirmationScreenState();
}

class _WaitingPayConfirmationScreenState
    extends State<WaitingPayConfirmationScreen> {
  var _isCheckingStatus = false;
  VoidCallback? _disposeSubscriptionListener;

  @override
  void initState() {
    super.initState();
    _disposeSubscriptionListener = PaywallFlow.listenResolvePendingThenRecheck(
      context: context,
    );
  }

  @override
  void dispose() {
    _disposeSubscriptionListener?.call();
    super.dispose();
  }

  Future<void> _checkSubscriptionStatus() async {
    if (_isCheckingStatus) return;
    setState(() => _isCheckingStatus = true);
    try {
      await PaywallFlow.checkSubscriptionStatus(context);
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      debugPrint('Error checking subscription status: $e');
    } finally {
      if (mounted) setState(() => _isCheckingStatus = false);
    }
  }

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: UiAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.hourglass_top, size: 64),
              const Gap(12),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const Gap(8),
                  Text(
                    LocalizedMap(
                      value: {
                        languages.en: 'Processing...',
                        languages.ru: 'Обработка...',
                        languages.it: 'Elaborazione...',
                      },
                    ).getValue(locale),
                    style: const TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const Gap(24),
              Text(
                LocalizedMap(
                  value: {
                    languages.en: 'Waiting for payment confirmation',
                    languages.ru: 'Ожидаем подтверждение оплаты',
                    languages.it: 'In attesa di conferma del pagamento',
                  },
                ).getValue(locale),
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const Gap(16),
              Text(
                LocalizedMap(
                  value: {
                    languages.en:
                        'This usually takes less than a minute. You can check the status manually.',
                    languages.ru:
                        'Обычно это занимает меньше минуты. Вы можете проверить статус вручную.',
                    languages.it:
                        "Di solito richiede meno di un minuto. Puoi controllare lo stato manualmente.",
                  },
                ).getValue(locale),
                style: theme.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const Gap(32),
              UiLoader(
                builder: (final context, final setLoading, final isLoading) =>
                    UiTextButton(
                      isLoading: isLoading || _isCheckingStatus,
                      textTitle: LocalizedMap(
                        value: {
                          languages.en: 'Check Status',
                          languages.ru: 'Проверить статус',
                          languages.it: 'Controlla Stato',
                        },
                      ).getValue(locale),
                      onPressed: () async {
                        setLoading(true);
                        try {
                          await _checkSubscriptionStatus();
                        } finally {
                          setLoading(false);
                        }
                      },
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
