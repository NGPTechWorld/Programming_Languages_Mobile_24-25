import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FieldController {
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  var isEditing = false.obs;
  String initalValue = "";

  void setInitValue(String value) {
    initalValue = value;
    controller.text = initalValue;
  }

  void toggleEdit() {
    isEditing.value = !isEditing.value;
    if (isEditing.value) {
      // focusNode.requestFocus();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        focusNode.requestFocus();
        _showKeyboardIfNotVisible();
      });
    } else {
      focusNode.unfocus();
    }
  }

  void _showKeyboardIfNotVisible() {
    if (!focusNode.hasPrimaryFocus) {
      FocusScope.of(focusNode.context!).requestFocus(focusNode);
    }
  }

  getText() => controller.value.text;

  bool isChanged() {
    return initalValue != controller.text;
  }

  void reset() {
    isEditing.value = false;
    controller.text = initalValue;
    focusNode.unfocus();
  }

  void clear() {
    initalValue = "";
    reset();
  }
}
