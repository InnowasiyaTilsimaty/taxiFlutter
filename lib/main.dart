import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'configs/routes/routes.dart';
import 'configs/theme/app_theme.dart';
import 'view_model/view_model.dart';

GetIt getIt = GetIt.instance;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerLazySingleton<OrderViewModel>(OrderViewModel.new);

  runApp(const TaksistApp());
}

class TaksistApp extends StatelessWidget {
  const TaksistApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => getIt<OrderViewModel>()),
        ChangeNotifierProvider(create: (context) => MapViewModel()),
      ],
      child: MaterialApp(
        title: 'Taksist',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        themeMode: ThemeMode.light,
        initialRoute: RouteNames.splash,
        routes: Navigation.routes,
      ),
    );
  }
}
