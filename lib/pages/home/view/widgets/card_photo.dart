import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:leychenko_pixabay_test_app/services/theme/theme.dart';

import 'info_icon.dart';
import 'info_number.dart';

// ignore: must_be_immutable
class CardPhoto extends StatelessWidget {
  CardPhoto(
      {super.key,
      required this.largeImageURL,
      required this.previewURL,
      required this.views,
      required this.likes,
      required this.callEndLoaded});

  final String largeImageURL;
  final String previewURL;
  final int views;
  final int likes;
  bool isEndLoaded = false;
  final Function callEndLoaded;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: appColors.cardColor,
        borderRadius: BorderRadius.circular(20), // радіус бордера
      ),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          CachedNetworkImage(
            imageUrl: previewURL,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) {
              isEndLoaded = true;
              callEndLoaded();
              return const Icon(Icons.error);
            },
            imageBuilder: (context, imageProvider) {
              isEndLoaded = true;
              callEndLoaded();
              return InstaImageViewer(
                  backgroundIsTransparent: true,
                  imageUrl: largeImageURL,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ));
            },
          ),
          const Positioned(
            top: 10,
            right: 10,
            child: InfoIcon(
              assetName: 'assets/img/iconmonstr-eye-9.svg',
            ),
          ),
          const Positioned(
            top: 75,
            right: 10,
            child: InfoIcon(
              assetName: 'assets/img/heart-icon.svg',
            ),
          ),
          Positioned(
              top: 42,
              right: 10,
              child: InfoNumber(
                viewNumber: views,
              )),
          Positioned(
              top: 108,
              right: 10,
              child: InfoNumber(
                viewNumber: likes,
              )),
        ],
      ),
    );
  }
}
