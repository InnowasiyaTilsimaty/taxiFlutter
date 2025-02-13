import 'package:flutter/material.dart';

import '../../view/view.dart';

abstract final class RouteNames {
  static const splash = '/splash';
  static const home = '/home';
}

abstract final class Navigation {
  static final routes = <String, Widget Function(BuildContext)>{
    RouteNames.splash: (_) => const SplashView(),
    RouteNames.home: (_) => const HomeView(),
  };
}
