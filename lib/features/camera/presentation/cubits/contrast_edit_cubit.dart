import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contrast_edit_cubit.freezed.dart';

@freezed
class ContrastEditState with _$ContrastEditState {
  const factory ContrastEditState.initial() = _Initial;
  const factory ContrastEditState.loading() = _Loading;
  const factory ContrastEditState.success(File image) = _Success;
  const factory ContrastEditState.error(String message) = _Error;
}

class ContrastEditCubit extends Cubit<ContrastEditState> {
  ContrastEditCubit() : super(const ContrastEditState.initial());

  void setContrastImage(File image) {
    try {
      emit(ContrastEditState.success(image));
    } catch (e) {
      emit(ContrastEditState.error(e.toString()));
    }
  }
}
