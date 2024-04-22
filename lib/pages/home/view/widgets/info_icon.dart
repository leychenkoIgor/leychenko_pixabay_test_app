import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leychenko_pixabay_test_app/services/theme/theme.dart';

class InfoIcon extends StatelessWidget {
  const InfoIcon({super.key, required this.assetName});
  final String assetName;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: appColors.infoIconBackground,
        borderRadius: BorderRadius.circular(50),
      ),
      child: SvgPicture.asset(
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        assetName, //'assets/img/heart-icon.svg',
      ),
    );
  }
}
