///
/// dashboard_state.dart
/// lib/features/main/presentation/cubits/dashboard
///
/// Created by Indra Mahesa https://github.com/zinct
///

part of 'dashboard_cubit.dart';

enum DashboardStatus {
  initial,
  loading,
  success,
  error,
}

@freezed
sealed class DashboardState with _$DashboardState {
  const factory DashboardState({
    required DashboardStatus status,
    required ErrorObject? error,
    DashboardEntity? data,
  }) = _DashboardState;

  factory DashboardState.initial() => const DashboardState(
        status: DashboardStatus.initial,
        error: null,
      );
}
