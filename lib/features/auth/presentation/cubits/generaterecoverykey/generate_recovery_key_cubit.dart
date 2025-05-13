///
/// generate_recovery_key_cubit.dart
/// lib/features/auth/presentation/cubits/generate_recovery_key
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:amanmemilih_mobile_app/features/auth/domain/entities/recoverykey/recovery_key_entity.dart';
import 'package:amanmemilih_mobile_app/features/auth/domain/usecases/generate_recovery_key_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/errors/errors.dart';

part 'generate_recovery_key_state.dart';
part 'generate_recovery_key_cubit.freezed.dart';

class GenerateRecoveryKeyCubit extends Cubit<GenerateRecoveryKeyState> {
  final GenerateRecoveryKeyUseCase _useCase;

  GenerateRecoveryKeyCubit(
    this._useCase,
  ) : super(GenerateRecoveryKeyState.initial());

  void getData(String? username) async {
    emit(state.copyWith(status: GenerateRecoveryKeyStatus.loading));

    final data =
        await _useCase.call(GenerateRecoveryKeyParams(username: username));

    return data.fold(
      (l) => emit(state.copyWith(
        status: GenerateRecoveryKeyStatus.error,
        error: ErrorObject.mapFailureToErrorObject(l),
      )),
      (r) {
        emit(state.copyWith(
          status: GenerateRecoveryKeyStatus.success,
          data: r,
        ));

        if (r == null) {
          emit(state.copyWith(
              status: GenerateRecoveryKeyStatus.error,
              error: ErrorObject(
                message: "Error when sync recovery key",
                title: "Error when sync recovery key",
                shortMessage: 'message: "Error when sync recovery key',
                failure: RecoveryKeyNotSyncFailure(),
              )));
        }
        syncRecoveryKey(r!);
      },
    );
  }

  void syncRecoveryKey(RecoveryKeyEntity key) {
    emit(state.copyWith(
      recoveryKey: [
        key.phrase1 ?? '',
        key.phrase2 ?? '',
        key.phrase3 ?? '',
        key.phrase4 ?? '',
        key.phrase5 ?? '',
        key.phrase6 ?? '',
        key.phrase7 ?? '',
        key.phrase8 ?? '',
        key.phrase9 ?? '',
        key.phrase10 ?? '',
        key.phrase11 ?? '',
        key.phrase12 ?? '',
      ],
    ));
  }

  void copyToClipBoard() async {
    final textData = state.recoveryKey.map((e) => e).join(', ');
    await Clipboard.setData(ClipboardData(text: textData));
  }
}
