import 'package:flutter/material.dart';

import '../../configs/routes/routes.dart';
import '../../main.dart';
import '../auth_service/auth_service.dart';
import '../service.dart';

final class SplashService {
  void checkState(BuildContext context) {
    Future<void>.delayed(const Duration(seconds: 2)).then(
      (value) async {
        final user = getIt<AuthService>().prefsService.getString(PreferencesKeys.user);
        if (user != null) {
          return Navigator.pushNamedAndRemoveUntil(
            context,
            RouteNames.main,
            (route) => false,
          );
        } else {
          return Navigator.pushNamedAndRemoveUntil(
            context,
            RouteNames.welcome,
            (route) => false,
          );
        }
      },
    );
  }
}
