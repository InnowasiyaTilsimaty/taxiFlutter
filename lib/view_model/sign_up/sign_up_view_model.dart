import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

import '../../configs/routes/routes.dart';
import '../../configs/snack_bar.dart';
import '../../configs/validators.dart';
import '../../data/exceptions.dart';
import '../../main.dart';
import '../../model/user/user_model.dart';
import '../../repository/repository.dart';
import '../../service/auth/auth_service.dart';

class SignupViewModel extends ChangeNotifier {
  final UserRepository userRepository;

  SignupViewModel({required this.userRepository});

  final authService = getIt<AuthService>();
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
      final result = await userRepository.signup(
        SignUpModel(
          username: nameController.text,
          phone: phoneController.text,
          referral: referralController.text,
        ),
      );
      await authService.signIn(result);
      //ignore: unawaited_futures
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteNames.main,
        (route) => false,
      );
    } catch (e) {
      if (e is HttpStatusException) {
        final dataAsString = e.responseBody as String;
        final Map<String, dynamic> errorMap = jsonDecode(dataAsString) as Map<String, dynamic>;
        final errorsList = errorMap.entries.map((entry) => entry.value[0]).toList();
        final firstError = errorsList.first.toString();
        showErrorSnackBar(firstError);
      } else {
        showErrorSnackBar(
          'Internet birikmesini barlan we tazeden synanysyn',
        );
      }
    }

    inProgress = false;
    notifyListeners();
  }

  @override
  void dispose() {
    nameController.dispose();
    referralController.dispose();
    phoneController.dispose();
    phoneError = null;
    super.dispose();
  }
}
