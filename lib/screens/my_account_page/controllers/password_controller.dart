import 'package:get/get.dart';
import 'package:ngpiteapp/screens/my_account_page/controllers/field_controller.dart';


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
