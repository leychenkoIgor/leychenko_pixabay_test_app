import 'package:pixabay_api/pixabay_api.dart';
import 'package:test/test.dart';

void main() {
  PixabayAPI pixabayAPI =
      PixabayAPI("https://pixabay.com", "43471674-3c93ea4a2a220b169f739aaee");

  group('Api pixabay.com: ', ()
  {
    late Photos photos;
    setUp(() async {
      photos = await pixabayAPI.getPhotos();
    });
    test('We are checking the received data.', () async {

      // if (photos.hits.isEmpty) {
      //   throw "ERROR:  An empty array of photos was received from the server.";
      // }
        expect(photos.hits.length, 20);
    });
  });
}
