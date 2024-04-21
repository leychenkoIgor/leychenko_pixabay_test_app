import 'package:flutter/material.dart';

class InfoNumber extends StatelessWidget {
  const InfoNumber({super.key, required this.viewNumber});
  final int viewNumber;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          viewNumber.toString(),
          style: const TextStyle(color: Colors.black),
        ));
  }
}
