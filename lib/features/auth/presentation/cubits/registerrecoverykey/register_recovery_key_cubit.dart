///
/// register_recovery_key_cubit.dart
/// lib/features/auth/presentation/cubits/register_recovery_key
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'dart:math';

import 'package:amanmemilih_mobile_app/features/auth/domain/entities/recoverykey/recovery_key_entity.dart';
import 'package:amanmemilih_mobile_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/errors/errors.dart';

part 'register_recovery_key_state.dart';
part 'register_recovery_key_cubit.freezed.dart';

class RegisterRecoveryKeyCubit extends Cubit<RegisterRecoveryKeyState> {
  final TextEditingController phrase1Controller;
  final TextEditingController phrase2Controller;
  final TextEditingController phrase3Controller;
  final TextEditingController phrase4Controller;
  final TextEditingController phrase5Controller;
  final TextEditingController phrase6Controller;
  final TextEditingController phrase7Controller;
  final TextEditingController phrase8Controller;
  final TextEditingController phrase9Controller;
  final TextEditingController phrase10Controller;
  final TextEditingController phrase11Controller;
  final TextEditingController phrase12Controller;

  final RegisterUseCase _useCase;

  RegisterRecoveryKeyCubit(
    this.phrase1Controller,
    this.phrase2Controller,
    this.phrase3Controller,
    this.phrase4Controller,
    this.phrase5Controller,
    this.phrase6Controller,
    this.phrase7Controller,
    this.phrase8Controller,
    this.phrase9Controller,
    this.phrase10Controller,
    this.phrase11Controller,
    this.phrase12Controller,
    this._useCase,
  ) : super(RegisterRecoveryKeyState.initial());

  void register(String? username, String? password) async {
    emit(state.copyWith(status: RegisterRecoveryKeyStatus.loading));

    final data = await _useCase.call(RegisterParams(
      username: username,
      password: password,
      phrase1: phrase1Controller.text,
      phrase2: phrase2Controller.text,
      phrase3: phrase3Controller.text,
      phrase4: phrase4Controller.text,
      phrase5: phrase5Controller.text,
      phrase6: phrase6Controller.text,
      phrase7: phrase7Controller.text,
      phrase8: phrase8Controller.text,
      phrase9: phrase9Controller.text,
      phrase10: phrase10Controller.text,
      phrase11: phrase11Controller.text,
      phrase12: phrase12Controller.text,
    ));

    return data.fold(
        (l) => emit(state.copyWith(
              status: RegisterRecoveryKeyStatus.error,
              error: ErrorObject.mapFailureToErrorObject(l),
            )),
        (r) => emit(state.copyWith(
              status: RegisterRecoveryKeyStatus.success,
            )));
  }

  void toggleHiddenKey() {
    emit(state.copyWith(isKeyHidden: !state.isKeyHidden));
  }

  void getData(RecoveryKeyEntity key) {
    final controllers = [
      phrase1Controller,
      phrase2Controller,
      phrase3Controller,
      phrase4Controller,
      phrase5Controller,
      phrase6Controller,
      phrase7Controller,
      phrase8Controller,
      phrase9Controller,
      phrase10Controller,
      phrase11Controller,
      phrase12Controller,
    ];

    final phrases = [
      key.phrase1,
      key.phrase2,
      key.phrase3,
      key.phrase4,
      key.phrase5,
      key.phrase6,
      key.phrase7,
      key.phrase8,
      key.phrase9,
      key.phrase10,
      key.phrase11,
      key.phrase12,
    ];

    int max = 5;
    int iterator = 1;

    for (int i = 0; i < controllers.length; i++) {
      if (Random().nextInt(2) != 1 && iterator <= max) {
        iterator = iterator + 1;
      } else {
        controllers[i].text = phrases[i]!;
      }
    }
  }
}
