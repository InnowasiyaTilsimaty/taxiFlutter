import 'package:flutter/material.dart';

import '../../configs/components/settings_app_bar.dart';
import 'widgets/widgets.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SettingsAppBar(title: 'Sargytlar'),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        itemBuilder: (context, index) => const OrderCard(),
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemCount: 2,
      ),
    );
  }
}
