import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sharpness_edit_cubit.freezed.dart';

@freezed
class SharpnessEditState with _$SharpnessEditState {
  const factory SharpnessEditState.initial() = _Initial;
  const factory SharpnessEditState.loading() = _Loading;
  const factory SharpnessEditState.success(File image) = _Success;
  const factory SharpnessEditState.error(String message) = _Error;
}

class SharpnessEditCubit extends Cubit<SharpnessEditState> {
  SharpnessEditCubit() : super(const SharpnessEditState.initial());

  void setSharpnessImage(File image) {
    try {
      emit(SharpnessEditState.success(image));
    } catch (e) {
      emit(SharpnessEditState.error(e.toString()));
    }
  }
}
