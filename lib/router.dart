import 'package:flupro/pages/home/home.dart';
import 'package:flupro/pages/mine/mine.dart';
import 'package:flupro/pages/widgets/drop_view.dart';
import 'package:flupro/pages/widgets/shadow_bubble.dart';
import 'package:flutter/cupertino.dart';

import 'app.dart';
import 'base/widgets/toast.dart';
import 'pages/tabbar/tabbar.dart';
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
  '/mine',
];

final routerProivder = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    observers: [
      routeObserver,
      Toast.toastNavigatorObserver(),
    ],
    redirect: (context, state) {
      // if (!ref.read(isLoggedProvider) &&
      //     !_notLoginRoutes.contains(state.subloc)) {
      //   return '/login';
      // }
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        redirect: (context, state) => '/home',
      ),
      GoRoute(
        path: '/home',
        pageBuilder: (context, state) => const MaterialPage(
          child: TabbarScaffold(
            type: TabbarType.home,
            body: HomePage(),
          ),
        ),
      ),
      GoRoute(
        path: '/mine',
        pageBuilder: (context, state) => const MaterialPage(
          child: TabbarScaffold(
            type: TabbarType.mine,
            body: MinePage(),
          ),
        ),
      ),
      GoRoute(
        path: '/widgets/drop',
        pageBuilder: (context, state) => const CupertinoPage(
          child: DropView(),
        ),
      ),
      GoRoute(
        path: '/widgets/bubble',
        pageBuilder: (context, state) => const CupertinoPage(
          child: ShadowBubble(),
        ),
      ),
    ],
  );
});
