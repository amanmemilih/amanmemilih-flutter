///
/// register_cubit.dart
/// lib/features/auth/presentation/cubits/register
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/errors/errors.dart';

part 'register_state.dart';
part 'register_cubit.freezed.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState.initial());
}
