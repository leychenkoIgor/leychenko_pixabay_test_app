part of 'locatization_cubit.dart';

@immutable
sealed class LocatizationState {
  final Locale locale;

  LocatizationState(this.locale);
}

final class LocatizationInitial extends LocatizationState {
  LocatizationInitial(super.locale);
}

final class LocatizationNew extends LocatizationState {
  LocatizationNew(super.locale);
}

final class LocatizationNewLoaded extends LocatizationState {
  LocatizationNewLoaded(super.locale);
}
