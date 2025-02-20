import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../configs/assets.dart';
import '../../../configs/theme/app_colors.dart';
import '../../../configs/theme/app_theme.dart';
import '../../../view_model/view_model.dart';

class CallOperators extends StatelessWidget {
  const CallOperators({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final settingsViewModel = context.read<SettingsViewModel>();

    return Column(
      spacing: 8,
      children: [
        Text(
          'Ähli soraglaryňyz boýunça operatorlar bilen habarlaşyp bilerisiz:',
          style: textTheme.labelMedium,
        ),
        _NumberTile(
          onTap: () => settingsViewModel.makePhoneCall('+99364929340'),
          number: '+993 64 92 93 40',
        ),
        _NumberTile(
          onTap: () => settingsViewModel.makePhoneCall('+99364929340'),
          number: '+993 64 92 93 40',
        ),
        _NumberTile(
          onTap: () => settingsViewModel.makePhoneCall('+99364929340'),
          number: '+993 64 92 93 40',
        ),
      ],
    );
  }
}

class _NumberTile extends StatelessWidget {
  final String number;
  final VoidCallback onTap;

  const _NumberTile({
    super.key,
    required this.number,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textThemeEx = context.textThemeEx;

    return ListTile(
      onTap: onTap,
      tileColor: AppColors.primary,
      minTileHeight: 48,
      contentPadding: const EdgeInsets.only(left: 18, right: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text(
        number,
        style: textThemeEx.titleMediumEx,
      ),
      trailing: IconButton(
        onPressed: onTap,
        style: IconButton.styleFrom(
          minimumSize: const Size(39, 39),
          maximumSize: const Size(39, 39),
          backgroundColor: AppColors.graySoft.withValues(alpha: 0.2),
        ),
        icon: SvgPicture.asset(Assets.callCircular),
      ),
    );
  }
}
