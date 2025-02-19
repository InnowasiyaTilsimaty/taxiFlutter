import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../configs/assets.dart';
import '../../../configs/extension.dart';
import '../../../configs/theme/app_colors.dart';
import '../../../view_model/view_model.dart';

class MakeOrderTextField extends StatelessWidget {
  const MakeOrderTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MakeOrderViewModel>();

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: viewModel.addressControllers.length > 2 ? 140 : 115,
      child: ListView(
        physics: const ScrollPhysics(),
        children: [
          Column(
            spacing: 12,
            children: [
              ...viewModel.addressControllers.mapIndexed(
                    (controller, index) => _OrderTextField(
                  controller: controller,
                  index: index,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class _OrderTextField extends StatelessWidget {
  final TextEditingController controller;
  final int index;
  const _OrderTextField({
    super.key,
    required this.controller,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MakeOrderViewModel>();
    return Row(
      children: [
        IconButton(
          onPressed: () => context
              .read<MakeOrderViewModel>()
              .removeAddressController(context, index),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(24, 24),
            foregroundColor: AppColors.black,
            backgroundColor: Colors.transparent,
          ),
          icon: SvgPicture.asset(Assets.remove),
        ),
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: index == 0 ? 'Salgyňyz...' : 'Saýlanmadyk',
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: index == 0
                    ? SvgPicture.asset(Assets.location)
                    : SvgPicture.asset(Assets.finishFlag),
              ),
              prefixIconConstraints: const BoxConstraints(
                minWidth: 24,
                minHeight: 24,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        IconButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(48, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(11),
            ),
          ),
          icon: SvgPicture.asset(Assets.maps),
        ),
        const SizedBox(width: 10),
        if (index == viewModel.addressControllers.length - 1) ...[
          IconButton(
            onPressed: context.read<MakeOrderViewModel>().addAddressController,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(48, 48),
              backgroundColor: Colors.transparent,
              foregroundColor: AppColors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11),
                side: const BorderSide(color: AppColors.primary),
              ),
            ),
            icon: SvgPicture.asset(Assets.add),
          ),
          const SizedBox(width: 10),
        ],
      ],
    );
  }
}
