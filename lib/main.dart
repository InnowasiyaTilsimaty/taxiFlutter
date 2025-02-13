import 'package:flutter/material.dart';

import 'configs/routes/routes.dart';

void main() {
  runApp(const TaksistApp());
}

class TaksistApp extends StatelessWidget {
  const TaksistApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taksist',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        initialRoute: RouteNames.splash,
        routes: Navigation.routes,
    );
  }
}
