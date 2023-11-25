import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrightnessCubit extends Cubit<Brightness?> {
  BrightnessCubit() : super(null);

  void setBrightness(Brightness brightness) {
    emit(brightness);
  }

  void switchBrightness() {
    return switch (state) {
      Brightness.dark => emit(Brightness.light),
      Brightness.light => emit(Brightness.dark),
      null => null,
    };
  }
}
