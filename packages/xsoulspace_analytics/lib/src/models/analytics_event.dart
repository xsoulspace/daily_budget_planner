class AnalyticsEvent {
  const AnalyticsEvent({
    required this.name,
    this.parameters,
  });
  factory AnalyticsEvent.fromJson(final Map<String, dynamic> json) =>
      AnalyticsEvent(name: json['name'], parameters: json['parameters']);

  final String name;
  final Map<String, dynamic>? parameters;
  Map<String, dynamic> toJson() => {
        'name': name,
        'parameters': parameters,
      };
}
