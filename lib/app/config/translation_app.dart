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

          // OTP / log in
          StringManager.GetStarted: "أهلا وسهلا",
          StringManager.LoginOrSignUp:
              "قم بتسجيل الدخول في حال كان لديك حساب، او قم بإنشاء حساب جديد",
          StringManager.enterPhoneNumber: "أدخل رقم الهاتف",
          StringManager.byClicking: "بالضغط على الزر فأنا أوافق على ",
          StringManager.termsAndConditions: "الشروط والأحكام",
          StringManager.andSign: " و ",
          StringManager.privacyPolicy: "سياسة الخصوصية",
          //Login
          StringManager.dontHaveAccount: "ليس لديك حساب في التطبيق",
          StringManager.errorisEmpty: "هذا الحقل فارغ",
          StringManager.errorPhonenumberIsPaten: "رقم الهاتف غير صحيح",
          StringManager.errorPasswordIsMin: "يجب ان تكون أكثر من 6 خانات",
          StringManager.errorPasswordIsPatern:
              "يجب ان تحوي أحرف كبيرة وصغيرة وأرقام",
          StringManager.subTiltleLogin: "قم بتسجيل الدخول لإسختدام التطبيق",
          // Address
          StringManager.addressHeader: "عنوانك",
          StringManager.addressName: "الاسم",
          StringManager.addressAddress: "الموقع",
          StringManager.addressStreet: "الشارع",
          StringManager.addressNotes: "ملاحظات إضافية",
          StringManager.addressSave: "حفظ",

          // Profile Page
          StringManager.profileHeader: "الملف الشخصي",
          StringManager.profileMyAccount: "حسابي",
          StringManager.profileTrackOrder: "تتبع الطلب",
          StringManager.profileLocation: "المواقع",
          StringManager.profileOrderHistory: "سجل الطلبات",
          StringManager.profileLanguage: "اللغة",
          StringManager.profileHelpAndSupport: "المساعدة والدعم",

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
          StringManager.subTiltleLogin: "Login to use the app",
          // OTP / log in
          StringManager.GetStarted: "Welcom Back!",
          StringManager.LoginOrSignUp: "Login or signup to use the app ",
          StringManager.enterPhoneNumber: "Enter phone number",
          StringManager.byClicking: "By clicking i accept the ",
          StringManager.termsAndConditions: "Terms & Conditions",
          StringManager.andSign: " & ",
          StringManager.privacyPolicy: "Privacy Policy",
          //Login
          StringManager.dontHaveAccount: "Dont have account",
          StringManager.errorisEmpty: "This field is empty",
          StringManager.errorPhonenumberIsPaten: "The phone number is invalid",
          StringManager.errorPasswordIsMin: "At least 6 characters",
          StringManager.errorPasswordIsPatern:
              "At least one number and special character",

          // Address
          StringManager.addressHeader: "Your Location",
          StringManager.addressName: "Name",
          StringManager.addressAddress: "Location",
          StringManager.addressStreet: "Street",
          StringManager.addressNotes: "Additional Notes",
          StringManager.addressSave: "Save",

          // Profile Page
          StringManager.profileHeader: "Profile",
          StringManager.profileMyAccount: "My Account",
          StringManager.profileTrackOrder: "Track Order",
          StringManager.profileLocation: "Locations",
          StringManager.profileOrderHistory: "Order History",
          StringManager.profileLanguage: "Language",
          StringManager.profileHelpAndSupport: "Help & Support",
          // MyAccount
          // TODO : compolete this in Ar
          StringManager.myAccountUpdate: "Update",
          StringManager.myAccountCancel: "Cancel",
          StringManager.myAccountHeader: "My Account",
          StringManager.myAccountFirstName: "First Name",
          StringManager.myAccountLastName: "Last Name",
          StringManager.myAccountPhone: "Phone Number",
          StringManager.myAccountEmail: "Email",
          StringManager.myAccountFinish: "Finish",
          StringManager.myAccountEdit: "Edit",
          StringManager.myAccountDiscard: "Discard",
          StringManager.myAccountDialogContent:
              "Do you want to save your changes before exiting?",
          StringManager.myAccountDialogTitle: "Unsaved Changes",
          StringManager.myAccountChangePassword: "Change password",
          StringManager.myAccountChangePasswordCancel: "Cancel",
          StringManager.myAccountOldPassword: "Old password",
          StringManager.myAccountNewPassword: "New password",
          StringManager.myAccountConfirmPassword: "Confirm new password",
          //Error
          StringManager.strNoInternetError:
              "No Connection, please check your internet connection and try again",
          //success
          StringManager.loginSuccess: "login is successful",
          StringManager.SingupSuccess: "Singup is successful",
        },
      };
}
