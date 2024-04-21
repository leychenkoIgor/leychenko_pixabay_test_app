part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeLoadingPhotosEvent extends HomeEvent {}

class HomeLoadedPhotosEvent extends HomeEvent {}

class HomeEndLoadedPhotoEvent extends HomeEvent {
  final int id;

  HomeEndLoadedPhotoEvent(this.id);
}
