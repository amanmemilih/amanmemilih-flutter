///
/// forgot_password_cubit.dart
/// lib/features/auth/presentation/cubits/forgot_password
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:amanmemilih_mobile_app/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/errors/errors.dart';

part 'forgot_password_state.dart';
part 'forgot_password_cubit.freezed.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
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
  final TextEditingController passwordController;
  final TextEditingController passwordConfirmationController;
  final GlobalKey<FormState> formKey;

  final ForgotPasswordUseCase _useCase;

  ForgotPasswordCubit(
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
    this.passwordController,
    this.passwordConfirmationController,
    this.formKey,
    this._useCase,
  ) : super(ForgotPasswordState.initial());

  void forgotPassword() async {
    emit(state.copyWith(status: ForgotPasswordStatus.loading));

    final data = await _useCase.call(ForgotPasswordParams(
      password: passwordController.text,
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
              status: ForgotPasswordStatus.error,
              error: ErrorObject.mapFailureToErrorObject(l),
            )),
        (r) => emit(state.copyWith(
              status: ForgotPasswordStatus.success,
            )));
  }

  void toggleHiddenKey() {
    emit(state.copyWith(isKeyHidden: !state.isKeyHidden));
  }

  void toggleHiddenPassword() {
    emit(state.copyWith(isPasswordHidden: !state.isPasswordHidden));
  }

  void toggleHiddenPasswordConfirmation() {
    emit(state.copyWith(
        isPasswordConfirmationHidden: !state.isPasswordConfirmationHidden));
  }
}
