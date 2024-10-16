import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics_event.freezed.dart';
part 'analytics_event.g.dart';

@freezed
class AnalyticsEvent with _$AnalyticsEvent {
  const factory AnalyticsEvent({
    required final String name,
    final Map<String, dynamic>? parameters,
  }) = _AnalyticsEvent;

  factory AnalyticsEvent.fromJson(final Map<String, dynamic> json) =>
      _$AnalyticsEventFromJson(json);
}
