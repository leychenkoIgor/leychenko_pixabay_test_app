part of 'home_bloc.dart';

abstract class HomeState {
  // List<PhotoModel> listPhotos = [];
}

final class HomeInitial extends HomeState {}

final class HomeLoadingPhotos extends HomeState {
}

final class HomeLoadedPhotos extends HomeState {
}
