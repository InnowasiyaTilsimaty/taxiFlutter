import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../configs/snack_bar.dart';
import '../../main.dart';
import '../../model/model.dart';
import '../../repository/repository.dart';
import '../../service/auth/auth_service.dart';

class SettingsViewModel extends ChangeNotifier {
  final UserRepository userRepository;

  SettingsViewModel({required this.userRepository});

  final authService = getIt<AuthService>();

  void copyReferralCode(String text) {
    Clipboard.setData(
      ClipboardData(text: text),
    ).then(
      (value) => showSnackBar(
        'Referral kody gocurildi!',
      ),
    );
  }

  Future<void> shareReferralCode(String message) async {
    await Share.share(message, subject: 'Welcome Message');
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> getMe() async {
    try {
      final result = await userRepository.getMe();
      await authService.writeUser(result);
    } catch (e) {
      //ignore
    }
    notifyListeners();
  }

  GetMe? getUser() {
    return authService.getUser();
  }
}
