import 'package:get/get.dart';
import 'package:shop_app/constants.dart';

class PasswordController extends GetxController {
  RxString error = ''.obs;
  late String password;
  void validate(String value) {
    if (value.isEmpty) {
      error.value = kPassNullError;
    } else if (value.length < 8) {
      error.value = kShortPassError;
    } else {
      error.value = '';
    }
  }

  void save(String? password) {
    this.password = password!;
  }
}
