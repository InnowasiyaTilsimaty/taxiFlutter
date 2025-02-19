import 'package:flutter/material.dart';

import 'theme/app_colors.dart';

/// Scaffold messenger key
final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

void showErrorSnackBar(String message, {SnackBarAction? action}) {
  showSnackBar(
    message,
    action: action,
    backgroundColor: AppColors.red,
  );
}

void showSnackBar(
  String message, {
  SnackBarAction? action,
  Color? textColor,
  Color? iconColor,
  Color? backgroundColor,
  EdgeInsetsGeometry? margin,
}) {
  final scaffoldMessenger = scaffoldMessengerKey.currentState;
  if (scaffoldMessenger == null) {
    assert(false, 'ScaffoldMessenger not initiated');

    return;
  }

  scaffoldMessenger
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2.5),
        margin: margin,
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
}
