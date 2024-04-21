library pixabay_api;

import 'package:dio/dio.dart';
import 'package:pixabay_api/pixabay_api_client.dart';

import 'models/models.dart';

export 'models/models.dart';

class PixabayAPI {
  late PixabayAPIClient pixabayAPIClient;
  final String apiUrl;
  final String key;
  final int page;
  final int perPage;

  PixabayAPI(this.apiUrl, this.key, {this.page = 1, this.perPage = 20}) {
    pixabayAPIClient = PixabayAPIClient(Dio(), baseUrl: apiUrl);
  }

  Future<Photos> getPhotos({int? page, int? perPage}) {
    return pixabayAPIClient.getPhotos(
        key, page ?? this.page, perPage ?? this.perPage);
  }
}
