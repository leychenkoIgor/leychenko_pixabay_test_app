import 'package:get_it/get_it.dart';
import 'package:pixabay_api/pixabay_api.dart';

part 'models/photo_mdl.dart';

class ApiPhotos {
  List<PhotoModel> listPhotos = [];
  int total = 0;
  int page = 1;


  int get perPage => GetIt.I<PixabayAPI>().perPage;

  String getLargeImageURL(Photo e) {
    if (e.largeImageURL.isNotEmpty) {
      return e.largeImageURL;
    } else if (e.webformatURL.isNotEmpty) {
      return e.webformatURL;
    } else {
      return e.previewURL;
    }
  }

  Future<List<PhotoModel>> firstGet() async {
    if (listPhotos.isEmpty) {
      Photos photos = await GetIt.I<PixabayAPI>().getPhotos(page: page);
      total = photos.totalHits;
      listPhotos = createListPhotoModel(photos.hits);
    }
    return listPhotos;
  }

  bool get isEndPhotos => !((page * GetIt.I<PixabayAPI>().perPage) < total);

  List<PhotoModel> createListPhotoModel(List<Photo> hits) {
    return hits
        .map((e) => PhotoModel(
            previewURL: e.previewURL,
            webformatURL: e.webformatURL,
            largeImageURL: getLargeImageURL(e),
            views: e.views,
            likes: e.likes,
            imageHeight: e.imageHeight,
            imageWidth: e.imageWidth,
            id: e.id))
        .toList();
  }

  Future<List<PhotoModel>> nextPageGet() async {
    if (!isEndPhotos) {
      page++;
      Photos photos = await GetIt.I<PixabayAPI>().getPhotos(page: page);
      total = photos.total;
      List<PhotoModel> resPhotos = createListPhotoModel(photos.hits);
      listPhotos.addAll(resPhotos);
      return resPhotos;
    }
    return listPhotos;
  }
}
