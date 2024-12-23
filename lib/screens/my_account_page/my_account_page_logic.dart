import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/data/entities/get_user_entitie.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/data/repositories/users_repositories.dart';
import 'package:ngpiteapp/screens/custom_widgets/snack_bar_error.dart';
import 'package:ngpiteapp/screens/forgot_password_page/forgot_password_page.dart';
import 'package:ngpiteapp/screens/forgot_password_page/forgot_password_page_logic.dart';
import 'package:ngpiteapp/screens/my_account_page/controllers/field_controller.dart';
import 'package:ngpiteapp/screens/my_account_page/controllers/password_controller.dart';
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
  RxBool changed = false.obs;
  RxString imagePath = "".obs;
  final userRepo = Get.find<ImpUsersRepositories>();
  // final netCheck = Get.find<NetworkInfoImpl>();
  var loadingImageState = LoadingState.idle.obs;
  var loadingState = LoadingState.idle.obs;
  var editingState = LoadingState.idle.obs;
  var isVisablePass = false.obs;

  void getUser(BuildContext context) async {
    loadingState.value = LoadingState.loading;
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
  }

  void resetValues() {
    changed.value = false;
    firstNameFieldControllor.reset();
    lastNameFieldControllor.reset();
    emailFieldControllor.reset();
    passwordController.turnOffVisible();
  }

  updateValues(BuildContext context) async {
    editingState.value = LoadingState.loading;
    String successMessage = "", failedMessage = "";
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
    String msg = "";
    if (successMessage != "") msg += successMessage;
    if (failedMessage != "")
      msg += (successMessage != "" ? "\n" : "") + failedMessage;
    SnackBarCustom.show(context, msg);

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
    // TODO :Show the Picture
  }
  getPicture(BuildContext context) async {
    loadingImageState.value = LoadingState.loading;
    final response = await userRepo.getImage();

    if (response.success) {
      loadingImageState.value = LoadingState.doneWithData;
      imagePath.value = response.data ?? "";
    } else {
      user.value = null;
      loadingImageState.value = LoadingState.hasError;
    }
  }

  void forgotPassword() {
    Get.to(() => ForgotPasswordPage(),
        binding: ForgotPasswordPageBinding(
            email: emailFieldControllor.initalValue,
            number: phoneFieldControllor.initalValue));
  }
}
