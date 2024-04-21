import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get_it/get_it.dart';
import 'package:leychenko_pixabay_test_app/pages/home/view/widgets/card_photo.dart';
import 'package:leychenko_pixabay_test_app/services/api/api.dart';

import '../models/photo_view.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<Widget> photoWidgets = [];
  bool isProcessLoadedAllPhotos = false;
  final ScrollController scrollController = ScrollController();

  HomeBloc() : super(HomeInitial()) {
    scrollController.addListener(_scrollListener);

    on<HomeLoadingPhotosEvent>((event, emit) {
      emit(HomeLoadingPhotos(
          createListPhotoView(GetIt.I<ApiPhotos>().listPhotos)));
    });
    on<HomeLoadedPhotosEvent>((event, emit) {
      emit(HomeLoadedPhotos(state.listPhotoVw));
    });
    on<HomeEndLoadedPhotoEvent>((event, emit) {
      if (checkEndLoadedAllPhotos() && isProcessLoadedAllPhotos) {
        isProcessLoadedAllPhotos = false;
        checkCompleteList();
      }
    });

    loaddingPhotos();
    loadPhotos();
  }

  bool checkEndLoadedAllPhotos() {
    for (PhotoView photoWid in state.listPhotoVw) {
      if (!(photoWid.wg as CardPhoto).isEndLoaded) {
        return false;
      }
    }
    return true;
  }

  checkCompleteList() {
    if (scrollController.position.maxScrollExtent == 0.0) {
      loadPhotos();
    }
  }

  void _scrollListener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      loadPhotos();
    }
  }

  List<PhotoView> createListPhotoView(List<PhotoModel> photos) {
    isProcessLoadedAllPhotos = true;
    return photos
        .map((e) => PhotoView(
            CardPhoto(
                previewURL: e.previewURL,
                largeImageURL: e.largeImageURL,
                callEndLoaded: () {
                  add(HomeEndLoadedPhotoEvent(e.id));
                },
                views: e.views,
                likes: e.likes),
            PhotoModel(
                previewURL: e.previewURL,
                largeImageURL: e.largeImageURL,
                views: e.views,
                likes: e.likes,
                id: e.id)))
        .toList();
  }

  loaddingPhotos() {
    add(HomeLoadingPhotosEvent());
  }

  loadPhotos() async {
    List<PhotoModel> photos = [];
    if (GetIt.I<ApiPhotos>().listPhotos.isEmpty) {
      photos = await GetIt.I<ApiPhotos>().firstGet();
      state.listPhotoVw = createListPhotoView(photos);
    } else if (!GetIt.I<ApiPhotos>().isEndPhotos) {
      photos = await GetIt.I<ApiPhotos>().nextPageGet();
      state.listPhotoVw.addAll(createListPhotoView(photos));
    } else {
      return;
    }

    add(HomeLoadedPhotosEvent());
  }
}
