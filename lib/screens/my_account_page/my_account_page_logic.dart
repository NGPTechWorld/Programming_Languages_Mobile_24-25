import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MyAccountController());
  }
}

class TempUser {
  String firstName = "Ahmad";
  String lastName = "Hamad";
  String email = "o@gmail.com";
  String phone = "0932287131";
}

class MyAccountController extends GetxController {
  late TempUser user;
  late FieldController firstNameFieldControllor;
  late FieldController lastNameFieldControllor;
  late FieldController emailFieldControllor;
  late FieldController phoneFieldControllor;
  RxBool changed = false.obs;

  MyAccountController() {
    user = TempUser();
    firstNameFieldControllor = FieldController(user.firstName);
    lastNameFieldControllor = FieldController(user.lastName);
    emailFieldControllor = FieldController(user.email);
    phoneFieldControllor = FieldController(user.phone);
  }

  void resetValues() {
    changed.value = false;
    firstNameFieldControllor.reset();
    lastNameFieldControllor.reset();
    emailFieldControllor.reset();
    phoneFieldControllor.reset();
  }

  void sendUpdatedValues() {
    // user.firstName = firstNameFieldControllor.getText();
    // user.phone = phoneFieldControllor.getText();
    // firstNameFieldControllor.initalValue = user.firstName;
    // phoneFieldControllor.initalValue = user.phone;
    resetValues();
  }

  void isChanged() {
    changed.value = firstNameFieldControllor.isChanged() ||
        lastNameFieldControllor.isChanged() ||
        phoneFieldControllor.isChanged();
  }

  void saveChanges() {}

  void pictureUpdate() {}
}

class FieldController {
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  var isEditing = false.obs;
  String initalValue;

  FieldController(this.initalValue) {
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
}
