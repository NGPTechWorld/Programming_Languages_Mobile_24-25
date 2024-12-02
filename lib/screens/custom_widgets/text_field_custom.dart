import '../../app/config/color_manager.dart';
import '../../app/config/style_manager.dart';
import '../../app/config/values_manager.dart';
import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final title;
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
  final suffixIcon;
  final hintText;
  const TextFieldCustom(
      {super.key,
      this.title = null,
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
      this.hintText = "",
      this.suffixIcon = null});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: AppPadding.p8, bottom: AppPadding.p16),
          child: TextFormField(
            cursorColor: ColorManager.firstColor,
            readOnly: readOnly,
            style: style ?? StyleManager.h4_Regular(),
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            validator: validator,
            autovalidateMode: autoValidateMode,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle:
                  StyleManager.h4_Regular(color: ColorManager.primary4Color),
              errorStyle:
                  StyleManager.body02_Medium(color: ColorManager.redColor),
              filled: true,
              fillColor: fillColor,
              contentPadding: const EdgeInsets.all(AppPadding.p16),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
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
