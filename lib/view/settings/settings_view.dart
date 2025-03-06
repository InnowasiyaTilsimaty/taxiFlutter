import 'package:flutter/material.dart';

import '../../configs/components/settings_app_bar.dart';
import '../../configs/theme/app_colors.dart';
import '../../view_model/view_model.dart';
import 'widgets/widgets.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  void initState() {
    context.read<SettingsViewModel>().getMe();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<SettingsViewModel>().getUser();
    return Scaffold(
      appBar: const SettingsAppBar(title: 'Sazlamalar'),
      body: Stack(
        children: [
          ListView(
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
          if (user?.id == null)
            ColoredBox(
              color: AppColors.black.withValues(alpha: 0.5),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
