import 'package:get/get.dart';
import 'package:shop_app/constants.dart';

class EmailFieldController extends GetxController {
  RxString error = ''.obs;
  late String email;
  void validate(String value) {
    if (value.isEmpty) {
      error.value = kEmailNullError;
    } else if (!emailValidatorRegExp.hasMatch(value)) {
      error.value = kInvalidEmailError;
    } else {
      error.value = '';
    }
  }

  void save(String? email) {
    this.email = email!;
  }
}
