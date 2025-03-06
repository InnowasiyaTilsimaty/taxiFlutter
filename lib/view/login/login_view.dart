import 'package:flutter/material.dart';

import '../../configs/components/phone_text_field.dart';
import '../../configs/validators.dart';
import '../../view_model/view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    context.read<LoginViewModel>().phoneError = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loginViewModel = context.watch<LoginViewModel>();
    final themeTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 18),
        child: Form(
          key: loginViewModel.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Şahsy maglumatyňyzy\n dolduryň!',
                style: themeTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 23),
              TextFormField(
                controller: loginViewModel.nameController,
                validator: Validator.emptyField,
                decoration: const InputDecoration(
                  hintText: 'Name',
                ),
              ),
              const SizedBox(height: 10),
              PhoneTextField(
                validator: loginViewModel.phoneError,
                controller: loginViewModel.phoneController,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => context.read<LoginViewModel>().login(context),
                child: loginViewModel.inProgress
                    ? const CircularProgressIndicator()
                    : Text(
                        'Gir',
                        style: themeTheme.bodyMedium,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
