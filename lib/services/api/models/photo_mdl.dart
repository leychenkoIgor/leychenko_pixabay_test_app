part of '../api.dart';

class PhotoModel {
  PhotoModel({
    required this.previewURL,
    required this.largeImageURL,
    required this.views,
    required this.likes,
    required this.id,
  });

  final String previewURL;
  final String largeImageURL;
  final int views;
  final int likes;
  final int id;
}
