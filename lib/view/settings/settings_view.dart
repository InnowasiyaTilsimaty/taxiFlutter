import 'package:flutter/material.dart';

import '../../configs/components/settings_app_bar.dart';
import 'widgets/widgets.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: const SettingsAppBar(title: 'Sazlamalar'),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
        children: const [
          PhoneTile(),
          SizedBox(height: 14),
          SettingsTile(),
          SizedBox(height: 14),
          DriverReferral(),
          SizedBox(height: 14),
          CallOperators(),
          SizedBox(height: 26),
          SocialMedia(),
          SizedBox(height: 22),
          AppVersion(),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
