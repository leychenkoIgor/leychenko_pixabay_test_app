import 'package:flutter/material.dart';
import 'package:leychenko_pixabay_test_app/services/api/api.dart';

class PhotoView {
  PhotoView(this.wg, this.photo);

  Widget wg;
  final PhotoModel photo;
}
