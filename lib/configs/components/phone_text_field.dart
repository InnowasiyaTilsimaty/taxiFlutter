import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../assets.dart';
import '../theme/app_colors.dart';

class PhoneTextField extends StatefulWidget {
  final TextEditingController? controller;

  const PhoneTextField({
    super.key,
    this.controller,
  });

  @override
  State<PhoneTextField> createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.removeListener(() {});
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeTheme = Theme.of(context).textTheme;
    const fieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(
        right: Radius.circular(8),
      ),
      borderSide: BorderSide.none,
    );
    final borderColor =
        _focusNode.hasFocus ? AppColors.primary : AppColors.gray;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Row(
          children: [
            Stack(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: borderColor),
                      left: BorderSide(color: borderColor),
                      top: BorderSide(color: borderColor),
                    ),
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      spacing: 10,
                      children: [
                        Image.asset(
                          Assets.tmFlag,
                          width: 24,
                          height: 16,
                        ),
                        SvgPicture.asset(Assets.arrowDown),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: borderColor),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: TextFormField(
                  focusNode: _focusNode,
                  controller: widget.controller,
                  style: themeTheme.labelLarge,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 12, 1, 12),
                      child: Text(
                        '+993 ',
                        style: themeTheme.labelLarge,
                      ),
                    ),
                    enabledBorder: fieldBorder,
                    focusedBorder: fieldBorder,
                    errorBorder: fieldBorder,
                  ),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(8),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  keyboardType: TextInputType.phone,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
