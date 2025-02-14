import 'package:flutter/material.dart';
import '../../configs/assets.dart';
import '../../configs/components/indicators.dart';
import '../../configs/routes/routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
        context,
        RouteNames.welcome,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 10),
            SvgPicture.asset(Assets.logo),
            const LoadingDotsIndicator(),
          ],
        ),
      ),
    );
  }
}
