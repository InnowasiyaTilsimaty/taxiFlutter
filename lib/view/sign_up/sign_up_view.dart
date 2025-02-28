import 'package:flutter/material.dart';

import '../../configs/assets.dart';
import '../../configs/components/phone_text_field.dart';
import '../../configs/routes/routes.dart';
import '../../configs/validators.dart';
import '../../view_model/view_model.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {

  @override
  void initState() {
    context.read<SignupViewModel>().phoneError = null;
    super.initState();
  }

  @override
  void dispose() {
    context.read<SignupViewModel>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signupViewModel = context.watch<SignupViewModel>();
    final themeTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 18),
        child: Form(
          key: signupViewModel.formKey,
          child: Column(
            children: [
              const Expanded(child: SizedBox(height: 100)),
              Text(
                'Şahsy maglumatyňyzy\n dolduryň!',
                style: themeTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              Column(
                children: [
                  const SizedBox(height: 23),
                  TextFormField(
                    controller: signupViewModel.nameController,
                    validator: Validator.emptyField,
                    decoration: const InputDecoration(
                      hintText: 'Name',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: signupViewModel.referralController,
                    validator: Validator.emptyField,
                    decoration: InputDecoration(
                      hintText: 'Referal code',
                      suffixIcon: IconButton(
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.black,
                        ),
                        icon: SvgPicture.asset(Assets.qrcodeScan),
                        onPressed: () => Navigator.pushNamed(
                          context,
                          RouteNames.qrScan,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  PhoneTextField(
                    validator: signupViewModel.phoneError,
                    controller: signupViewModel.phoneController,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => context.read<SignupViewModel>().signUp(context),
                    child: signupViewModel.inProgress
                        ? const CircularProgressIndicator()
                        : Text(
                            'Agza bol',
                            style: themeTheme.bodyMedium,
                          ),
                  ),
                ],
              ),
              const Expanded(child: SizedBox(height: 10)),
              TextButton(
                onPressed: () => Navigator.pushNamed(
                  context,
                  RouteNames.login,
                ),
                child: Text(
                  'Siziň hasabyňyz barmy onda giriň',
                  style: themeTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
