part of 'analytics_bloc.dart';

@freezed
class AnalyticsState with _$AnalyticsState {
  const factory AnalyticsState.initial() = _Initial;
  const factory AnalyticsState.loading({required AnalyticsView view}) = Loading;
  const factory AnalyticsState.loaded({required AnalyticsView view}) = Loaded;
  const factory AnalyticsState.error(String error) = Error;
}
