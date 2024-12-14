import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/services/connection/network_info.dart';
import 'package:ngpiteapp/data/entities/get_user_entitie.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/data/repositories/users_repositories.dart';
import 'package:ngpiteapp/screens/custom_widgets/snack_bar_error.dart';
import 'package:ngpiteapp/screens/upload_picture_page/upload_picture_page.dart';
import 'package:ngpiteapp/screens/upload_picture_page/upload_picture_page_logic.dart';

class MyAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MyAccountController());
  }
}

class MyAccountController extends GetxController {
  final user = Rxn<GetUserEntitie>();
  final FieldController firstNameFieldControllor = FieldController();
  final FieldController lastNameFieldControllor = FieldController();
  final FieldController emailFieldControllor = FieldController();
  final FieldController phoneFieldControllor = FieldController();
  final PasswordController passwordController = PasswordController();
  RxString imagePath = "".obs;
  RxBool changed = false.obs;
  final userRepo = Get.find<ImpUsersRepositories>();
  final netCheck = Get.find<NetworkInfoImpl>();
  var loadingState = LoadingState.idle.obs;
  var editingState = LoadingState.idle.obs;

  void getUser(BuildContext context) async {
    loadingState.value = LoadingState.loading;
    if (await netCheck.isConnected) {
      final response = await userRepo.currentUser();

      if (response.success) {
        loadingState.value = LoadingState.doneWithData;
        user.value = response.data;
        firstNameFieldControllor.setInitValue(user.value!.firstName);
        lastNameFieldControllor.setInitValue(user.value!.lastName);
        emailFieldControllor.setInitValue(user.value!.email);
        phoneFieldControllor.setInitValue(user.value!.phone);
      } else {
        user.value = null;
        loadingState.value = LoadingState.hasError;
      }
    } else {
      SnackBarCustom.show(context, StringManager.nointernet.tr);
      loadingState.value = LoadingState.hasError;
    }
  }

  void resetValues() {
    changed.value = false;
    firstNameFieldControllor.reset();
    lastNameFieldControllor.reset();
    emailFieldControllor.reset();
    passwordController.turnOffVisible();
  }

  Future<bool> updateValues(BuildContext context) async {
    editingState.value = LoadingState.loading;
    String successMessage = "", failedMessage = "";
    if (await netCheck.isConnected) {
      if (passwordController.isChanged()) {
        final response = await userRepo.resetPassword(
            old_password: passwordController.oldPasswordController.getText(),
            new_password: passwordController.newPasswordController.getText(),
            new_password_confirmation:
                passwordController.confirmPasswordController.getText());
        if (response.success) {
          successMessage += " " + StringManager.myAccountPasswordUpdated.tr;
        } else {
          failedMessage += ' ' + response.networkFailure!.message;
          editingState.value = LoadingState.hasError;
        }
      }
      final response = await userRepo.editUser(
        first_name: firstNameFieldControllor.getText(),
        last_name: lastNameFieldControllor.getText(),
        email: emailFieldControllor.getText(),
      );
      if (response.success) {
        successMessage = StringManager.myAccountUserUpdated.tr + successMessage;
        editingState.value = LoadingState.doneWithData;
        user.value!.firstName = response.data.firstName;
        user.value!.lastName = response.data.lastName;
        user.value!.email = response.data.email;
        firstNameFieldControllor.initalValue = user.value!.firstName;
        lastNameFieldControllor.initalValue = user.value!.lastName;
        emailFieldControllor.initalValue = user.value!.email;
      } else {
        failedMessage += response.networkFailure!.message + failedMessage;
        editingState.value = LoadingState.hasError;
      }
    } else {
      SnackBarCustom.show(context, StringManager.nointernet.tr);
      editingState.value = LoadingState.hasError;
    }
    SnackBarCustom.show(context, successMessage + "\n" + failedMessage);

    resetValues();
    return true;
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
    // TODO :Show the Picture
  }
  Future<bool> getPicture(BuildContext context) async {
    loadingState.value = LoadingState.loading;
    if (await netCheck.isConnected) {
      final response = await userRepo.getImage();

      if (response.success) {
        loadingState.value = LoadingState.doneWithData;
        imagePath.value = response.data ?? "";
        print(response.data);
      } else {
        user.value = null;
        loadingState.value = LoadingState.hasError;
      }
    } else {
      SnackBarCustom.show(context, StringManager.nointernet.tr);
      loadingState.value = LoadingState.hasError;
    }
    return true;
  }
}

class PasswordController {
  FieldController oldPasswordController = FieldController();
  FieldController newPasswordController = FieldController();
  FieldController confirmPasswordController = FieldController();
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
