import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:leychenko_pixabay_test_app/screens/photo_page/view/photo_page.dart';

import '../screens/home/home.dart';

void initGoRouter() {
  GetIt.instance.registerSingleton<GoRouter>(GoRouter(
    initialLocation: "/home",
    routes: [
      GoRoute(
          path: '/home',
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
                path: 'page/:id',
                pageBuilder: (context, state) => CustomTransitionPage<void>(
                      key: state.pageKey,
                      child: PhotoPageScreen(
                        index: state.pathParameters['id']!,
                      ),
                      barrierDismissible: true,
                      barrierColor: Colors.black38,
                      opaque: false,
                      transitionDuration: const Duration(milliseconds: 500),
                      reverseTransitionDuration:
                          const Duration(milliseconds: 500),
                      transitionsBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation,
                          Widget child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                    )),
          ]),
    ],
  ));
}

class MyRoute extends MaterialPageRoute {
  MyRoute({required super.builder});

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);
}

GoRouter get goRouter => GetIt.I<GoRouter>();
