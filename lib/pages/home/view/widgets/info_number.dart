import 'package:flutter/material.dart';
import 'package:leychenko_pixabay_test_app/services/theme/theme.dart';

class InfoNumber extends StatelessWidget {
  const InfoNumber({super.key, required this.viewNumber});
  final int viewNumber;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(6,3,6,3),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          viewNumber.toString(),
          style: const TextStyle(color: Colors.black),
        ));
  }
}
