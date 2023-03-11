import 'package:flutter/material.dart';

import 'app.dart';
import 'base/widgets/toast.dart';
import 'providers/auth_provider.dart';

final _notLoginRoutes = [
  '/',
  '/splash',
  '/login',
  '/register',
  '/forget_password',
  '/setting',
  '/home',
  '/mine',
];

final _rootRoutes = [
  '/home',
  '/group',
  '/mine',
];

final routerProivder = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/splash',
    debugLogDiagnostics: true,
    observers: [
      routeObserver,
      Toast.toastNavigatorObserver(),
    ],
    redirect: (context, state) {
      if (!ref.read(isLoggedProvider) &&
          !_notLoginRoutes.contains(state.subloc)) {
        return '/login';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        redirect: (context, state) => '/home',
      ),
    ],
  );
});
