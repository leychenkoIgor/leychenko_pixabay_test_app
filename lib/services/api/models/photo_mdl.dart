part of '../api.dart';

class PhotoModel {
  PhotoModel({
    required this.webformatURL,
    required this.previewURL,
    required this.largeImageURL,
    required this.views,
    required this.likes,
    required this.id,
    required this.imageWidth,
    required this.imageHeight,
  });

  final String previewURL;
  final String largeImageURL;
  final String webformatURL;
  final int imageWidth;
  final int imageHeight;
  final int views;
  final int likes;
  final int id;

}
