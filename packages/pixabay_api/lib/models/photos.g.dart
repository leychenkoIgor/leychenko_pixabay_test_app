// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Photos _$PhotosFromJson(Map<String, dynamic> json) => Photos(
      hits: (json['hits'] as List<dynamic>)
          .map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int,
      totalHits: json['totalHits'] as int,
    );

Map<String, dynamic> _$PhotosToJson(Photos instance) => <String, dynamic>{
      'total': instance.total,
      'totalHits': instance.totalHits,
      'hits': instance.hits,
    };
