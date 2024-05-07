import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:leychenko_pixabay_test_app/services/api/api.dart';
import 'package:path/path.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

part 'photo_page_event.dart';

part 'photo_page_state.dart';

class PhotoPageBloc extends Bloc<PhotoPageEvent, PhotoPageState> {
  late PhotoModel photoModel;

  PhotoPageBloc() : super(PhotoPageInitial()) {
    on<PhotoPageEvent>((event, emit) {
    });
  }

  Size initImageBoxSize(double width, double height) {
    double heightImg = photoModel.imageHeight.toDouble();
    double widthImg = photoModel.imageWidth.toDouble();

    Size returnSize = Size(width, height);
    double pr = (widthImg * 100) / heightImg;
    double hp = (pr * height) / 100;
    returnSize = Size(hp, height);
    if (returnSize.width > width) {
      double hpH = width / (pr / 100);
      returnSize = Size(width, hpH);
    }

    return returnSize;
  }

  sharePhoto(BuildContext context) async {
    try {
      String fileName = basename(photoModel.previewURL);
      File file = await DefaultCacheManager()
          .getSingleFile(photoModel.largeImageURL);
      final box = context.findRenderObject() as RenderBox?;
      if (file.path.isNotEmpty) {
        await Share.shareXFiles([XFile(file.path, name: fileName)],
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,);
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
