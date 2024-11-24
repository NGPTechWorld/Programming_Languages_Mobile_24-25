import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';

class TranslationApp implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          //Sign Up
          StringManager.signup: "حساب جديد",
          StringManager.join: "دخول",
          StringManager.alreadyHaveAccount: "لدي حساب في التطبيق",
          StringManager.firstName: "الاسم الأول",
          StringManager.lastName: "الكنية",
          StringManager.startYear: "سنة البدء في الكلية: ",
          StringManager.huntUsername: "يستخدم هذا الاسم عند تسجيل الدخول",
          StringManager.password: "كلمة المرور",
          StringManager.confirmPassword: "تأكيد كلمة المرور",
          StringManager.userName: "اسم المستخدم",
          StringManager.login: "تسجيل الدخول",
          //Login
          StringManager.dontHaveAccount: "ليس لديك حساب في التطبيق",
          StringManager.errorisEmpty: "هذا الحقل فارغ",
          StringManager.errorPhonenumberIsPaten: "رقم الهاتف غير صحيح",
          StringManager.errorPasswordIsMin: "يجب ان تكون أكثر من 6 خانات",
          StringManager.errorPasswordIsPatern:
              "يجب ان تحوي أحرف كبيرة وصغيرة وأرقام",
          //Error
          StringManager.strNoInternetError: "لا يوجد انترنت",
          //success
          StringManager.loginSuccess: "تم تسجيل الدخول بنجاح",
          StringManager.SingupSuccess: "تم انشاء الحساب بنجاح",
        },
        "en": {
          //Sign Up
          StringManager.signup: "Sign Up",
          StringManager.join: "Join",
          StringManager.alreadyHaveAccount: "Already have account",
          StringManager.firstName: "First Name",
          StringManager.lastName: "Last Name",
          StringManager.huntUsername: "use username in login app",
          StringManager.startYear: "Start Year",
          StringManager.password: "Password",
          StringManager.confirmPassword: "Password Confirm",
          StringManager.userName: "Username",
          StringManager.login: "Login",
          //Login
          StringManager.dontHaveAccount: "Dont have account",
          StringManager.errorisEmpty: "This field is empty",
          StringManager.errorPhonenumberIsPaten: "The phone number is invalid",
          StringManager.errorPasswordIsMin: "At least 6 characters",
          StringManager.errorPasswordIsPatern:
              "At least one number and special character",
          //Error
          StringManager.strNoInternetError:
              "No Connection, please check your internet connection and try again",
          //success
          StringManager.loginSuccess: "login is successful",
          StringManager.SingupSuccess: "Singup is successful",
        },
      };
}
