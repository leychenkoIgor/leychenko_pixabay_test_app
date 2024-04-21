import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../pages/home/home.dart';

void initGoRouter() {
  GetIt.instance.registerSingleton<GoRouter>(GoRouter(
    initialLocation: "/home",
    routes: [
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomePage(),
      ),
    ],
  ));
}

GoRouter get goRouter => GetIt.I<GoRouter>();
