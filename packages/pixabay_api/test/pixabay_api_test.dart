import 'package:pixabay_api/pixabay_api.dart';
import 'package:test/test.dart';

void main() {
  PixabayAPI pixabayAPI =
      PixabayAPI("https://pixabay.com", "43471674-3c93ea4a2a220b169f739aaee");
  Photos photos;
  test('Test connect to pixabay.com', () async {
    try {
      photos = await pixabayAPI.getPhotos();
    } on Exception catch (e) {
      print(e);
      throw "";
    }
    if (photos.hits.isEmpty) {
      throw "ERROR:  An empty array of photos was received from the server.";
    }
  });
}
