import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoIcon extends StatelessWidget {
  const InfoIcon({super.key, required this.assetName});
  final String assetName;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(0.6),
        borderRadius: BorderRadius.circular(50),
      ),
      child: SvgPicture.asset(
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        assetName, //'assets/img/heart-icon.svg',
      ),
    );
  }
}
