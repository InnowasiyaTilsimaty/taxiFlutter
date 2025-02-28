import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'configs/routes/routes.dart';
import 'configs/snack_bar.dart';
import 'configs/theme/app_theme.dart';
import 'repository/repository.dart';
import 'service/auth/auth_service.dart';
import 'service/service.dart';
import 'view_model/view_model.dart';

GetIt getIt = GetIt.instance;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  getIt.registerSingletonAsync<AppPrefsService>(
    () async => AppPrefsService(await SharedPreferences.getInstance()),
  );

  getIt.registerLazySingleton<SplashService>(SplashService.new);

  getIt.registerLazySingleton<OrderViewModel>(OrderViewModel.new);

  getIt.registerLazySingleton<UserRepository>(
    () => UserApiRepository(httpClientService: HttpClientService()),
  );

  getIt.registerLazySingleton<AuthService>(
    () => AuthService(prefsService: getIt()),
  );

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
        ChangeNotifierProvider(create: (context) => MakeOrderViewModel()),
        ChangeNotifierProvider(create: (context) => OrderInProgressViewModel()),
        ChangeNotifierProvider(create: (context) => OrderInProgressViewModel()),
        ChangeNotifierProvider(create: (context) => SettingsViewModel()),
        ChangeNotifierProvider(
          create: (context) => SignupViewModel(userRepository: getIt<UserRepository>()),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginViewModel(userRepository: getIt<UserRepository>()),
        ),
      ],
      child: MaterialApp(
        title: 'Taksist',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        themeMode: ThemeMode.light,
        scaffoldMessengerKey: scaffoldMessengerKey,
        initialRoute: RouteNames.splash,
        routes: Navigation.routes,
      ),
    );
  }
}
