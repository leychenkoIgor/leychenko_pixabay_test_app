import 'package:flutter/material.dart';
import 'package:leychenko_pixabay_test_app/services/theme/theme.dart';

class AppBarWdg extends StatelessWidget {
  final String title;

  const AppBarWdg({super.key, this.title = ""});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      automaticallyImplyLeading: false,
      title: Center(child: Container(
          padding: const EdgeInsets.fromLTRB(15,10,15,10),
          decoration: BoxDecoration(
            color: appTheme.appBarTheme.backgroundColor,
            borderRadius: BorderRadius.circular(30), // радіус бордера
          ),
          child: Text(title))),
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
    );
  }
}
