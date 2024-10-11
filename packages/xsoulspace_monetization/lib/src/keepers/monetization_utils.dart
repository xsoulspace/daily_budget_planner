/// The type of monetization used by the app.
enum MonetizationType {
  /// The app uses a subscription model.
  subscription,

  /// The app uses ads to activate subscription features.
  ads,

  /// The app is free to use and all subscription features are enabled.
  free;

  factory MonetizationType.fromJson(final String value) =>
      MonetizationType.values.byName(value);
}
