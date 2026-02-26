part of 'analytics_bloc.dart';

@freezed
class AnalyticsEvent with _$AnalyticsEvent {
  const factory AnalyticsEvent.started() = _Started;
  const factory AnalyticsEvent.loadAnalytics({required String period}) = LoadAnalyticsEvent;
}