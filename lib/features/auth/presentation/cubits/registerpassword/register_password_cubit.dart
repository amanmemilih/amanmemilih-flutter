///
/// register_password_cubit.dart
/// lib/features/auth/presentation/cubits/register_password
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/errors/errors.dart';

part 'register_password_state.dart';
part 'register_password_cubit.freezed.dart';

class RegisterPasswordCubit extends Cubit<RegisterPasswordState> {
  final GlobalKey<FormState> formKey;
  final TextEditingController passwordController;
  final TextEditingController passwordConfirmationController;

  RegisterPasswordCubit(
    this.formKey,
    this.passwordController,
    this.passwordConfirmationController,
  ) : super(RegisterPasswordState.initial());

  void clearInput() {
    passwordController.text = "";
    passwordConfirmationController.text = "";
  }

  void toggleHiddenPassword() {
    emit(state.copyWith(isPasswordHidden: !state.isPasswordHidden));
  }

  void toggleHiddenPasswordConfirmation() {
    emit(state.copyWith(
        isPasswordConfirmationHidden: !state.isPasswordConfirmationHidden));
  }
}
