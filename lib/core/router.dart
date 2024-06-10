import 'package:flutter_easebuzz/features/home_screen/next_screen.dart';
import 'package:go_router/go_router.dart';

import '../features/home_screen/home_screen.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/1',
      builder: (context, state) => NextScreen(),
    ),
  ],
);
