import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:leychenko_pixabay_test_app/go_router/router.dart';
import 'package:leychenko_pixabay_test_app/resources/resources.dart';
import 'package:leychenko_pixabay_test_app/services/api/api.dart';
import 'package:leychenko_pixabay_test_app/services/theme/theme.dart';

import 'info_icon.dart';
import 'info_number.dart';

// ignore: must_be_immutable
class CardPhoto extends StatelessWidget {
  CardPhoto(
      {super.key,
      required this.photoModel,
      required this.index,
      this.callLoadedPhoto});

  final int index;

  final PhotoModel photoModel;
  bool isEndLoaded = false;
  Function? callLoadedPhoto;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Hero(
          tag: index.toString(),
          child:
              CachedNetworkImage(
                  imageUrl: photoModel.webformatURL,
                  placeholder: (context, url) {
                    return Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: appColors.cardColor,
                      ),
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  },
                  errorWidget: (context, url, error) {
                    if (callLoadedPhoto != null) callLoadedPhoto!();
                    return const Icon(Icons.error);
                  },
                  imageBuilder: (context, imageProvider) {
                    if (callLoadedPhoto != null) callLoadedPhoto!();
                    return GestureDetector(
                      onTap: () {
                        goRouter.go("/home/page/$index");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }),
        ),
        const Positioned(
          top: 10,
          right: 10,
          child: InfoIcon(
            assetName: IconSvg.iconmonstrEye9,
          ),
        ),
        const Positioned(
          top: 75,
          right: 10,
          child:
          InfoIcon(
            assetName: IconSvg.heartIcon,
          ),
        ),
        Positioned(
            top: 42,
            right: 10,
            child: InfoNumber(
              viewNumber: photoModel.views,
            )),
        Positioned(
            top: 108,
            right: 10,
            child: InfoNumber(
              viewNumber: photoModel.likes,
            )),
      ],
    );
  }
}
