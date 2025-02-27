import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

import '../../configs/routes/routes.dart';
import '../../configs/snack_bar.dart';
import '../../configs/validators.dart';
import '../../model/user/user_model.dart';
import '../../repository/repository.dart';

class SignupViewModel extends ChangeNotifier {
  final UserRepository userRepository;

  SignupViewModel({required this.userRepository});

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final referralController = TextEditingController();
  final phoneController = TextEditingController();
  QRViewController? controller;
  bool inProgress = false;
  String? phoneError;

  bool get isInProgress => inProgress;

  void onQRViewCreated(BuildContext context, QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      referralController.text = scanData.code ?? '';
      if (scanData.code != null) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RouteNames.signUp,
          (route) => false,
        );
      }
      notifyListeners();
    });
  }

  void reassemble() {
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    } else if (Platform.isIOS) {
      controller?.resumeCamera();
    }
  }

  Future<void> signUp(BuildContext context) async {
    if (!formKey.currentState!.validate() || phoneValidator(phoneController.text) != null) {
      phoneError = phoneValidator(phoneController.text);
      notifyListeners();
      return;
    }
    phoneError = null;
    if (inProgress) return;
    inProgress = true;
    notifyListeners();

    try {
      await userRepository.signup(
        SignUpModel(
          username: nameController.text,
          phone: phoneController.text,
          referral: referralController.text,
        ),
      );
      //ignore: unawaited_futures
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteNames.main,
        (route) => false,
      );
    } catch (e) {
      showErrorSnackBar(e.toString());
    }

    inProgress = false;
    notifyListeners();
  }
}
