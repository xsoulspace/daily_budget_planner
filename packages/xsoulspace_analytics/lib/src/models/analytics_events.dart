import 'analytics_event.dart';

class AnalyticsEvents {
  AnalyticsEvents._();
  static const userSignUp = AnalyticsEvent(name: 'user_sign_up');
  static const userLogin = AnalyticsEvent(name: 'user_login');

  static const kPurchaseComplete = 'purchase_complete';
  static const kPurchaseValue = 'purchase_value';
  static const kPurchaseCurrency = 'purchase_currency';
  static const kPurchaseTransactionId = 'purchase_transaction_id';
  static AnalyticsEvent purchaseComplete({
    required final double value,
    required final String currency,
    required final String transactionId,
  }) =>
      AnalyticsEvent(
        name: kPurchaseComplete,
        parameters: {
          kPurchaseValue: value,
          kPurchaseCurrency: currency,
          kPurchaseTransactionId: transactionId,
        },
      );

  static const kScreenView = 'screen_view';
  static const kScreenViewScreenName = 'screen_name';
  static AnalyticsEvent screenView(final String screenName) => AnalyticsEvent(
        name: kScreenView,
        parameters: {kScreenViewScreenName: screenName},
      );

  static const kButtonClick = 'button_click';
  static const kButtonName = 'button_name';
  static AnalyticsEvent buttonClick(final String buttonName) => AnalyticsEvent(
        name: kButtonClick,
        parameters: {kButtonName: buttonName},
      );
}
