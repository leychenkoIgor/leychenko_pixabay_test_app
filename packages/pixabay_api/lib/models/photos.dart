import 'package:json_annotation/json_annotation.dart';
import 'package:pixabay_api/models/photo.dart';

part 'photos.g.dart';

@JsonSerializable()
class Photos {
  const Photos(
      {required this.hits, required this.total, required this.totalHits});

  factory Photos.fromJson(Map<String, dynamic> json) => _$PhotosFromJson(json);

  final int total;
  final int totalHits;
  final List<Photo> hits;

  Map<String, dynamic> toJson() => _$PhotosToJson(this);
}
