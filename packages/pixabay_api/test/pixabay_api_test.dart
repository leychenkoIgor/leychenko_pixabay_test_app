// import 'package:flutter_test/flutter_test.dart';
import 'package:pixabay_api/pixabay_api.dart';

//
void main() async {
  PixabayAPI pixabayAPI =
      PixabayAPI("https://pixabay.com", "43471674-3c93ea4a2a220b169f739aaee");

  // ignore: unused_local_variable
  Photos photos = await pixabayAPI.getPhotos();
}
