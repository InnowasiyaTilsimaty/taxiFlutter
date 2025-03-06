import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../configs/assets.dart';
import '../../../configs/theme/app_colors.dart';
import '../../../configs/theme/app_theme.dart';
import '../../../view_model/view_model.dart';

class DriverReferral extends StatelessWidget {
  const DriverReferral({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final textThemeEx = context.textThemeEx;
    final user = context.watch<SettingsViewModel>().getUser();
    final settingsViewModel = context.read<SettingsViewModel>();

    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.backgroundGray,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 7),
            child: Row(
              children: [
                SvgPicture.asset(Assets.driverRef),
                const SizedBox(width: 9),
                Text(
                  'Sürüjiniň referal kody',
                  style: textTheme.labelLarge,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => settingsViewModel.copyReferralCode(
                    user?.referralCode ?? '',
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.transparent,
                  ),
                  icon: SvgPicture.asset(Assets.copy),
                ),
              ],
            ),
          ),
          const Divider(),
          const SizedBox(height: 3),
          InkWell(
            onTap: () => showDialog<void>(
              context: context,
              builder: (context) {
                return ShowQrCode(
                  data: user?.referralCode ?? '',
                );
              },
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.gray),
              ),
              child: QrImageView(
                data: user?.referralCode ?? '',
                size: 66,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(9),
            child: ElevatedButton(
              onPressed: () => settingsViewModel.shareReferralCode(user?.referralCode ?? ''),
              child: Text(
                'Share etmek',
                style: textThemeEx.bodyLargeEx,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ShowQrCode extends StatelessWidget {
  final String data;

  const ShowQrCode({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      alignment: Alignment.center,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.gray),
        ),
        child: QrImageView(data: data),
      ),
    );
  }
}
