import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shop_app/components/custom_suffix_icon.dart';
import 'package:shop_app/components/fields/field_error_message.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/controller/password_field_controller.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key, required this.controller,
  });
  final PasswordController controller ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          onChanged: controller.validate,
          onSaved: controller.save,
          validator: (value) {
            controller.validate(value ?? '');
            return controller.error.value.isEmpty
                ? null
                : controller.error.value;
          },
          cursorColor: kTextColor,
          obscureText: true,
          decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'Enter your password',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              floatingLabelStyle: const TextStyle(color: kTextColor),
              suffixIcon: Padding(
                padding:
                    EdgeInsets.fromLTRB(0, width[20], width[20], width[20]),
                child: const CustomSuffixIcon(icon: svgLockPath),
              )),
        ),
        Obx(
          () => Container(
            height: controller.error.value.isNotEmpty ? height[40] : height[30],
            padding: EdgeInsets.only(bottom: height[5]),
            child: controller.error.value.isNotEmpty
                ? FieldErrorMessage(error: controller.error.value)
                : Container(),
          ),
        )
      ],
    );
  }
}
