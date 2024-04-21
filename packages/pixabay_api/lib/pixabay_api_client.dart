import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'models/photos.dart';

part 'pixabay_api_client.g.dart';

@RestApi(baseUrl: '')
abstract class PixabayAPIClient {
  factory PixabayAPIClient(Dio dio, {String baseUrl}) = _PixabayAPIClient;

  @GET('/api/')
  Future<Photos> getPhotos(@Query('key') String key, @Query('page') int page,
      @Query('per_page') int perPage,
      {@Query('image_type') String imageType = 'photo'});
}
