///
/// login_cubit.dart
/// lib/features/auth/presentation/cubits/login
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/errors/errors.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  final GlobalKey<FormState> formKey;
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  LoginCubit(
    this.formKey,
    this.usernameController,
    this.passwordController,
  ) : super(LoginState.initial());

  void clearInput() {
    usernameController.text = "";
    passwordController.text = "";
  }

  void toggleHiddenPassword() {
    emit(state.copyWith(isPasswordHidden: !state.isPasswordHidden));
  }
}
