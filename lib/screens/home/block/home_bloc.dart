import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get_it/get_it.dart';
import 'package:leychenko_pixabay_test_app/services/api/api.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  Map<String, bool> photosIsLoaded = Map();
  bool isInitLoadedAllPhotos = false;
  final ScrollController scrollController = ScrollController();

  List<PhotoModel> get listPhotos => GetIt.I<ApiPhotos>().listPhotos;

  HomeBloc() : super(HomeInitial()) {
    scrollController.addListener(_scrollListener);
    on<HomeLoadingPhotosEvent>((event, emit) => emit(HomeLoadingPhotos()));
    on<HomeLoadedPhotosEvent>((event, emit) => emit(HomeLoadedPhotos()));
    on<HomeEndLoadedPhotoEvent>((event, emit) => checkCompleteList());
    add(HomeLoadingPhotosEvent());
    loadPhotos();
  }

  bool checkEndLoadedAllPhotos() {
    return true;
  }

  checkCompleteList() {
    if (scrollController.position.maxScrollExtent == 0.0) {
      loadPhotos();
    } else {
      isInitLoadedAllPhotos = true;
    }
  }

  void _scrollListener() async {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 200) {
      loadPhotos();
    }
  }

  loaddingPhotos() {
    add(HomeLoadingPhotosEvent());
  }

  loadPhotos() async {
    if (GetIt.I<ApiPhotos>().listPhotos.isEmpty) {
      await GetIt.I<ApiPhotos>().firstGet();
    } else if (!GetIt.I<ApiPhotos>().isEndPhotos) {
      await GetIt.I<ApiPhotos>().nextPageGet();
    } else {
      return;
    }
    for (int i = 0; i < listPhotos.length; i++) {
      if(!photosIsLoaded.containsKey(listPhotos[i].id.toString())) {
        photosIsLoaded.addAll({listPhotos[i].id.toString():false});
      }
    }
    add(HomeLoadedPhotosEvent());
  }

  loadedImg(int index) {
    photosIsLoaded[listPhotos[index].id.toString()] = true;
    if (!isInitLoadedAllPhotos) {
      for (String key in photosIsLoaded.keys.toList()) {
        if (!photosIsLoaded[key]!) return;
      }
      add(HomeEndLoadedPhotoEvent());
    }
  }
}
