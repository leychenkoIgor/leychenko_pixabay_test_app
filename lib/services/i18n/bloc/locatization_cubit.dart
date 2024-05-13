import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'locatization_state.dart';

class LocatizationCubit extends Cubit<LocatizationState> {
  LocatizationCubit() : super(LocatizationInitial(Locale('uk', '')));

  setLocaleEn() => emit(LocatizationNew(Locale('en', '')));

  setLocaleUk() => emit(LocatizationNew(Locale('uk', '')));
  setLocalePl() => emit(LocatizationNew(Locale('pl', '')));
  setLocaleFr() => emit(LocatizationNew(Locale('fr', '')));

  newLocaleLoaded() => emit(LocatizationNewLoaded(state.locale));

  bool buildWhenScreen(_, state) {
    return state is LocatizationInitial || state is LocatizationNewLoaded;
  }

  bool buildWhenMain(_, state) {
    return state is LocatizationInitial || state is LocatizationNew;
  }
}
