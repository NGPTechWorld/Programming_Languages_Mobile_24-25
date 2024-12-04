import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/screens/upload_picture_page/upload_picture_page.dart';
import 'package:ngpiteapp/screens/upload_picture_page/upload_picture_page_logic.dart';

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
  late PasswordController passwordController;
  RxBool changed = false.obs;

  MyAccountController() {
    user = TempUser();
    firstNameFieldControllor = FieldController(user.firstName);
    lastNameFieldControllor = FieldController(user.lastName);
    emailFieldControllor = FieldController(user.email);
    phoneFieldControllor = FieldController(user.phone);
    passwordController = PasswordController();
  }

  void resetValues() {
    changed.value = false;
    firstNameFieldControllor.reset();
    lastNameFieldControllor.reset();
    emailFieldControllor.reset();
    phoneFieldControllor.reset();
    passwordController.turnOffVisible();
  }

  void updateValues() {
    // TODO : check if he changed the email or password;
    user.firstName = firstNameFieldControllor.getText();
    user.lastName = lastNameFieldControllor.getText();
    user.phone = phoneFieldControllor.getText();
    user.email = emailFieldControllor.getText();
    firstNameFieldControllor.initalValue = user.firstName;
    lastNameFieldControllor.initalValue = user.lastName;
    phoneFieldControllor.initalValue = user.phone;
    emailFieldControllor.initalValue = user.email;

    resetValues();
  }

  bool isChanged() {
    changed.value = firstNameFieldControllor.isChanged() ||
        lastNameFieldControllor.isChanged() ||
        emailFieldControllor.isChanged() ||
        phoneFieldControllor.isChanged() ||
        passwordController.isChanged();
    return changed.value;
  }

  void pictureUpdate() {
    Get.to(ProfilePictureUpload(), binding: UploadPicturePageBinding());
  }

  void showPicture() {
    // TODO :Go to Upload Picture Page
  }
}

class PasswordController {
  FieldController oldPasswordController = FieldController("");
  FieldController newPasswordController = FieldController("");
  FieldController confirmPasswordController = FieldController("");
  RxBool visible = false.obs;
  RxBool changed = false.obs;
  void toggleVisible() {
    visible.value = !visible.value;
    resetValues();
  }

  bool isVisible() => visible.value;

  void turnOffVisible() {
    visible.value = false;
    resetValues();
  }

  void resetValues() {
    oldPasswordController.clear();
    newPasswordController.clear();
    confirmPasswordController.clear();
  }

  bool isChanged() {
    changed.value = oldPasswordController.isChanged() ||
        newPasswordController.isChanged() ||
        confirmPasswordController.isChanged();
    return changed.value;
  }
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

  void clear() {
    initalValue = "";
    reset();
  }
}
