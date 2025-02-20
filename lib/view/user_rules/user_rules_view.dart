import 'package:flutter/material.dart';

import '../../configs/components/settings_app_bar.dart';

class UserRulesView extends StatelessWidget {
  const UserRulesView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const SettingsAppBar(title: 'Ulanyjy düzgünleri'),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
        children: [
          Text(
            'What is Lorem Ipsum?',
            style: textTheme.displayMedium,
          ),
          Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It ha",
            style: textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}
