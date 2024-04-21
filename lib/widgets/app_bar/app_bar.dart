import 'package:flutter/material.dart';

class AppBarWdg extends StatelessWidget {
  final String title;

  const AppBarWdg({super.key, this.title = ""});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      automaticallyImplyLeading: false,
      title: Center(child: Text(title)),
      surfaceTintColor: Colors.transparent,
    );
  }
}
