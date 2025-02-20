import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

import '../../configs/snack_bar.dart';

class SettingsViewModel extends ChangeNotifier {

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
}
