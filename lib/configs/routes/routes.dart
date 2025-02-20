import 'package:flutter/material.dart';

import '../../view/view.dart';

abstract final class RouteNames {
  RouteNames._();

  static const splash = '/splash';
  static const welcome = '/welcome';
  static const main = '/main';
  static const signUp = '/sign_up';
  static const settings = '/settings';
}

abstract final class Navigation {
  Navigation._();

  static final routes = <String, Widget Function(BuildContext)>{
    RouteNames.splash: (_) => const SplashView(),
    RouteNames.welcome: (_) => const WelcomeView(),
    RouteNames.main: (_) => const MainView(),
    RouteNames.signUp: (_) => const SignUpView(),
    RouteNames.settings: (_) => const SettingsView(),
  };
}
