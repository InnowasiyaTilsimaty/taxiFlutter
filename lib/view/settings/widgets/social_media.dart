import 'package:flutter/material.dart';

import '../../../configs/assets.dart';
import '../../../configs/theme/app_colors.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      spacing: 13,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Social media',
          style: textTheme.labelMedium,
        ),
        Wrap(
          children: [
            SocialMediaButton(
              icon: Assets.instagram,
              onTap: () {},
            ),
            SocialMediaButton(
              icon: Assets.telegram,
              onTap: () {},
            ),
            SocialMediaButton(
              icon: Assets.whatsApp,
              onTap: () {},
            ),
            SocialMediaButton(
              icon: Assets.imo,
              onTap: () {},
            ),
            SocialMediaButton(
              icon: Assets.tikTok,
              onTap: () {},
            ),
            SocialMediaButton(
              icon: Assets.browser,
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}

class SocialMediaButton extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;

  const SocialMediaButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      style: IconButton.styleFrom(
        backgroundColor: AppColors.white,
        shadowColor: Colors.black.withValues(alpha: 0.08),
        foregroundColor: AppColors.black,
        elevation: 4,
        side: const BorderSide(
          color: AppColors.whisperGray,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      icon: SvgPicture.asset(icon),
    );
  }
}
