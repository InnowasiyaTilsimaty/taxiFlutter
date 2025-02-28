import 'package:flutter/material.dart';
import '../../configs/assets.dart';
import '../../configs/components/indicators.dart';
import '../../main.dart';
import '../../service/service.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    super.initState();
    getIt<SplashService>().checkState(context);
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
