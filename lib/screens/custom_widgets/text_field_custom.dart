import 'package:flutter_svg/flutter_svg.dart';
import '../../app/config/assets_manager.dart';
import '../../app/config/color_manager.dart';
import '../../app/config/style_manager.dart';
import '../../app/config/values_manager.dart';
import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool isValid = true;
  final bool isNumberPhone, isPassword, obscureText, readOnly;
  final TextStyle? style;
  final TextInputType keyboardType;
  final AutovalidateMode? autoValidateMode;
  final Color fillColor;
  final String? Function(String?)? validator;
  final void Function()? onClick;
  final Widget? prefixIcon;
  const TextFieldCustom({
    super.key,
    required this.title,
    required this.controller,
    this.isNumberPhone = false,
    this.isPassword = false,
    this.onClick,
    this.obscureText = false,
    this.readOnly = false,
    this.validator,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.style,
    this.fillColor = ColorManager.primary1Color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: AppPadding.p8, bottom: AppPadding.p16),
          child: TextFormField(
            readOnly: readOnly,
            style: style ?? StyleManager.h4_Regular(),
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            validator: validator,
            autovalidateMode: autoValidateMode,
            decoration: InputDecoration(
              errorStyle:
                  StyleManager.body02_Medium(color: ColorManager.redColor),
              filled: true,
              fillColor: fillColor,
              contentPadding: const EdgeInsets.all(AppPadding.p16),
              prefixIcon: prefixIcon,
              suffixIcon: isPassword
                  ? IconButton(
                      onPressed: onClick,
                      icon: SvgPicture.asset(
                        AssetsManager.eyeSvg,
                        height: 20,
                        width: 20,
                      ),
                    )
                  : null,
              labelText: title,
              labelStyle:
                  StyleManager.h4_Regular(color: ColorManager.primary5Color),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSize.s10),
                borderSide: const BorderSide(),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSize.s10),
                borderSide: const BorderSide(color: ColorManager.firstColor),
              ),
            ),
          ),
        )
      ],
    );
  }
}
