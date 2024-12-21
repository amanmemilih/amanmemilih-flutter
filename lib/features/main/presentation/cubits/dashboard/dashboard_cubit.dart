///
/// dashboard_cubit.dart
/// lib/features/main/presentation/cubits/dashboard
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:amanmemilih_mobile_app/core/usecase/params.dart';
import 'package:amanmemilih_mobile_app/features/main/domain/entities/dashboard/dashboard_entity.dart';
import 'package:amanmemilih_mobile_app/features/main/domain/usecases/dashboard_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/errors/errors.dart';

part 'dashboard_state.dart';
part 'dashboard_cubit.freezed.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final DashboardUseCase _useCase;

  DashboardCubit(
    this._useCase,
  ) : super(DashboardState.initial());

  void getData() async {
    emit(state.copyWith(status: DashboardStatus.loading));

    final data = await _useCase.call(NoParams());

    return data.fold(
        (l) => emit(state.copyWith(
              status: DashboardStatus.error,
              error: ErrorObject.mapFailureToErrorObject(l),
            )),
        (r) => emit(state.copyWith(
              status: DashboardStatus.success,
              data: r,
            )));
  }
}
