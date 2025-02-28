import 'dart:convert';

import 'package:flutter/material.dart';

import '../../configs/routes/routes.dart';
import '../../configs/snack_bar.dart';
import '../../configs/validators.dart';
import '../../data/exceptions.dart';
import '../../main.dart';
import '../../model/user/user_model.dart';
import '../../repository/repository.dart';
import '../../service/auth_service/auth_service.dart';

class LoginViewModel extends ChangeNotifier {
  final UserRepository userRepository;

  LoginViewModel({required this.userRepository});

  final authService = getIt<AuthService>();
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  bool inProgress = false;
  String? phoneError;

  bool get isInProgress => inProgress;

  Future<void> login(BuildContext context) async {
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
      final result = await userRepository.login(
        LoginModel(
          username: nameController.text,
          phone: phoneController.text,
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
        final error = errorMap.values.firstOrNull.toString();
        showErrorSnackBar(error);
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
    phoneController.dispose();
    phoneError = null;
    super.dispose();
  }
}
