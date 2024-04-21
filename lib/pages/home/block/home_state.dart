part of 'home_bloc.dart';

abstract class HomeState {
  List<PhotoView> listPhotoVw = [];
}

final class HomeInitial extends HomeState {}

final class HomeLoadingPhotos extends HomeState {
  HomeLoadingPhotos(List<PhotoView> listPhotoVw) {
    super.listPhotoVw = listPhotoVw;
  }
}

final class HomeLoadedPhotos extends HomeState {
  HomeLoadedPhotos(List<PhotoView> listPhotoVw) {
    super.listPhotoVw = listPhotoVw;
  }
}
