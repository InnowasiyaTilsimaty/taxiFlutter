import 'package:flutter/material.dart';

import '../../configs/assets.dart';
import '../../configs/components/phone_text_field.dart';
import '../../configs/routes/routes.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 18),
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
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Name',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Referal code',
                    suffixIcon: IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.black,
                      ),
                      icon: SvgPicture.asset(Assets.qrcodeScan),
                      onPressed: () {},
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const PhoneTextField(),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouteNames.main,
                    (route) => false,
                  ),
                  child: Text(
                    'Agza bol',
                    style: themeTheme.bodyMedium,
                  ),
                ),
              ],
            ),
            const Expanded(child: SizedBox(height: 10)),
            TextButton(
              onPressed: () {},
              child: Text(
                'Siziň hasabyňyz barmy onda giriň',
                style: themeTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
