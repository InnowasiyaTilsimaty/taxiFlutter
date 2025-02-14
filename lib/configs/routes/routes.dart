import 'package:flutter/material.dart';

import '../../view/view.dart';

abstract final class RouteNames {
  RouteNames._();

  static const splash = '/splash';
  static const welcome = '/welcome';
  static const home = '/home';
  static const signUp = '/sign_up';
}

abstract final class Navigation {
  Navigation._();

  static final routes = <String, Widget Function(BuildContext)>{
    RouteNames.splash: (_) => const SplashView(),
    RouteNames.welcome: (_) => const WelcomeView(),
    RouteNames.home: (_) => const HomeView(),
    RouteNames.signUp: (_) => const SignUpView(),
  };
}
