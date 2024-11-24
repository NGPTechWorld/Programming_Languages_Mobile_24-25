import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/components/custom_suffix_icon.dart';
import 'package:shop_app/components/fields/field_error_message.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/controller/email_field_controller.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key, required this.controller});
  final EmailFieldController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          onChanged: controller.validate,
          onSaved: controller.save,
          validator: (value) {
            controller.validate(value ?? '');
            return controller.error.value.isNotEmpty
                ? controller.error.value
                : null;
          },
          cursorColor: kTextColor,
          decoration: InputDecoration(
            labelText: 'Email',
            hintText: 'Enter your email',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            floatingLabelStyle: const TextStyle(color: kTextColor),
            suffixIcon: Padding(
              padding: EdgeInsets.fromLTRB(0, width[20], width[20], width[20]),
              child: const CustomSuffixIcon(icon: svgMailPath),
            ),
          ),
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
