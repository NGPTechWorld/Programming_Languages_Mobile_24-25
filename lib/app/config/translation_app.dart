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
          StringManager.email: "البريد الألكتروني",
          StringManager.signuptitle: "اهلا بكم في تطبيق التوصيل",
          StringManager.signupSubtitle:
              "لإستخدام التطبيق يجب عليك انشاء حساب جديد",
          StringManager.numberPhone: "رقم الهاتف",
          // OTP / log in
          StringManager.GetStarted: "أهلا وسهلا",
          StringManager.LoginOrSignUp:
              "قم بتسجيل الدخول في حال كان لديك حساب، او قم بإنشاء حساب جديد",
          StringManager.enterPhoneNumber: "أدخل رقم الهاتف",
          StringManager.byClicking: "بالضغط على الزر فأنا أوافق على ",
          StringManager.termsAndConditions: "الشروط والأحكام",
          StringManager.andSign: " و ",
          StringManager.privacyPolicy: "سياسة الخصوصية",
          StringManager.phoneVerification: "ارسال الكود",
          StringManager.titlePhoneVerification: "التحقق من رقم الهاتف",
          StringManager.subTitlePhoneVerification:
              "لقد قمنا بإرسال كود من 6 خانات الى الرقم:",
          //Login
          StringManager.dontHaveAccount: "ليس لديك حساب في التطبيق",
          StringManager.errorisEmpty: "هذا الحقل فارغ",
          StringManager.errorPhonenumberIsPaten: "رقم الهاتف غير صحيح",
          StringManager.errorPasswordIsMin: "يجب ان تكون أكثر من 6 خانات",
          StringManager.errorPasswordIsPatern:
              "يجب ان تحوي أحرف كبيرة وصغيرة وأرقام",
          StringManager.subTiltleLogin: "قم بتسجيل الدخول لإسختدام التطبيق",
          // Address
          StringManager.addressPageTitle: "عنوانك",
          StringManager.addressPageName: "الاسم",
          StringManager.addressPageAddress: "العنوان",
          StringManager.addressPageStreet: "الشارع",
          StringManager.addressPageNotes: "ملاحظات إضافية",
          StringManager.addressPageSave: "حفظ",
          // Profile Page
          StringManager.profileHeader: "الملف الشخصي",
          StringManager.profileMyAccount: "حسابي",
          StringManager.profileTrackOrder: "تتبع الطلب",
          StringManager.profileAddress: "العناوين",
          StringManager.profileOrderHistory: "سجل الطلبات",
          StringManager.profileLanguage: "اللغة",
          StringManager.profileHelpAndSupport: "المساعدة والدعم",
          StringManager.logout: "تسجيل الخروج",
          // MyAccount
          StringManager.myAccountUpdate: "حفظ",
          StringManager.myAccountCancel: "إلغاء",
          StringManager.myAccountHeader: "حسابي",
          StringManager.myAccountFirstName: "الاسم",
          StringManager.myAccountLastName: "اللقب",
          StringManager.myAccountPhone: "رقم الهاتف",
          StringManager.myAccountEmail: "البريد الإلكتروني",
          StringManager.myAccountFinish: "تم",
          StringManager.myAccountEdit: "تعديل",
          StringManager.myAccountDiscard: "تجاهل",
          StringManager.myAccountDialogContent:
              "هل ترغب بحفظ التغيرات قبل الخروج؟",
          StringManager.myAccountDialogTitle: "لم يتم حفظ التغيرات",
          StringManager.myAccountChangePassword: "تغيير كلمة المرور",
          StringManager.myAccountChangePasswordCancel: "إلغاء",
          StringManager.myAccountOldPassword: "كلمة المرور القديمة",
          StringManager.myAccountNewPassword: "كلمة المرور الجديدة",
          StringManager.myAccountConfirmPassword: "تأكيد كلمة المرور",
          // Language Dialog
          StringManager.languageDialogTitle: "اللغة",
          // Location Page
          StringManager.showAddressesHeader: "العناوين",
          StringManager.showAddressesAddLocationButton: "اضافة عنوان جديد",
          StringManager.showAddressesDeleteDialogTitle: "تنبيه",
          StringManager.showAddressesDeleteDialogText:
              "هل تريد حذف هذا العنوان",
          StringManager.showAddressesDeleteDialogCancel: "لا",
          StringManager.showAddressesDeleteDialogDelete: "نعم",
          // Orders History Page
          StringManager.ordersHistoryHeader: "سجل الطلبات",
          StringManager.ordersHistorySucceedButton: "مكتملة",
          StringManager.ordersHistoryFailedButton: "ملغاة",
          StringManager.ordersHistoryOrder: "الطلب",

          // Track orderes Page
          StringManager.tarckOrdersHeader: "متابعة الطلب",
          StringManager.tarckOrdersOrder: "الطلب",
          StringManager.trackOrdersMenuEditText: "تعديل",
          StringManager.trackOrdersMenuCancelText: "الغاء الطلب",

          //Upload Image
          StringManager.titleUploadPicture: "اختار صورة مناسبة لك!",
          StringManager.subTitleUploadPicture: "ارجاء اختيار صورة شخصية",
          StringManager.uploadPicture: "رفع صورة شخصية",
          StringManager.chooseUploadPicture: "اختيار الصورة",
          StringManager.submitPicture: "رفع الصورة",
          //Error
          StringManager.strNoInternetError: "لا يوجد انترنت",
          //success
          StringManager.loginSuccess: "تم تسجيل الدخول بنجاح",
          StringManager.SingupSuccess: "تم انشاء الحساب بنجاح",
          StringManager.loading: "جاري التحميل ......",
          // Common in Order pages
          StringManager.orderDetailsHeader: "تفاصيل الطلب",
          StringManager.orderDetailsId: "المعرف",
          StringManager.orderDetailsProductName: "المنتج",
          StringManager.orderDetailsUnitCount: "العدد",
          StringManager.orderDetailsUnitPrice: "السعر",
          StringManager.orderDetailsTotalPrice: "الإجمالي",
          StringManager.orderDetailsStatus: "الحالة",
          StringManager.orderDetailsDate: "التاريخ",
          StringManager.orderDetailsAddress: "العنوان",
          StringManager.orderDetailsSyrianPounds: "ل.س",
          StringManager.ordersHistoryStatusCancelled : "ملغى" , 
          StringManager.ordersHistoryStatusRejected : "مرفوض" , 
          StringManager.ordersHistoryStatusCompleted : "منجز" , 
        },
        "en": {
          //Sign Up
          StringManager.signup: "Sign Up",
          StringManager.join: "Join",
          StringManager.alreadyHaveAccount: "Already have an account?",
          StringManager.firstName: "First Name",
          StringManager.lastName: "Last Name",
          StringManager.huntUsername: "use username in login app",
          StringManager.startYear: "Start Year",
          StringManager.password: "Password",
          StringManager.confirmPassword: "Password Confirm",
          StringManager.userName: "Username",
          StringManager.login: "Login",
          StringManager.email: "Email",
          StringManager.subTiltleLogin: "Login to use the app",
          StringManager.signuptitle: "Welcom To Delivery App",
          StringManager.signupSubtitle: "Sing Up to use the app",
          StringManager.numberPhone: "Phone Number",
          // OTP / log in
          StringManager.GetStarted: "Welcom Back!",
          StringManager.LoginOrSignUp: "Login or signup to use the app ",
          StringManager.enterPhoneNumber: "Enter phone number",
          StringManager.byClicking: "By clicking i accept the ",
          StringManager.termsAndConditions: "Terms & Conditions",
          StringManager.andSign: " & ",
          StringManager.privacyPolicy: "Privacy Policy",
          StringManager.titlePhoneVerification: "Phone Verification",
          StringManager.phoneVerification: "Sent Code",
          StringManager.subTitlePhoneVerification:
              "We have sent a code of 6 digits \nto the email:",
          //Login
          StringManager.dontHaveAccount: "Dont have an account?",
          StringManager.errorisEmpty: "This field is empty",
          StringManager.errorPhonenumberIsPaten: "The phone number is invalid",
          StringManager.errorPasswordIsMin: "At least 6 characters",
          StringManager.errorPasswordIsPatern:
              "At least one number and special character",

          // Address
          StringManager.addressPageTitle: "Your Address",
          StringManager.addressPageName: "Name",
          StringManager.addressPageAddress: "Address",
          StringManager.addressPageStreet: "Street",
          StringManager.addressPageNotes: "Additional Notes",
          StringManager.addressPageSave: "Save",
          // Profile Page
          StringManager.profileHeader: "Profile",
          StringManager.profileMyAccount: "My Account",
          StringManager.profileTrackOrder: "Track Order",
          StringManager.profileAddress: "Addresses",
          StringManager.profileOrderHistory: "Orders History",
          StringManager.profileLanguage: "Language",
          StringManager.profileHelpAndSupport: "Help & Support",
          StringManager.logout: "Logout",
          // MyAccount
          StringManager.myAccountUpdate: "Save",
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
          // Language Dialog
          StringManager.languageDialogTitle: "Language",

          // Location Page
          StringManager.showAddressesHeader: "My Addresses",
          StringManager.showAddressesAddLocationButton: "Add new address",
          StringManager.showAddressesDeleteDialogTitle: "Delete Address?",
          StringManager.showAddressesDeleteDialogText:
              "Do you want to delete this address?",
          StringManager.showAddressesDeleteDialogCancel: "No",
          StringManager.showAddressesDeleteDialogDelete: "Yes",

          // Orders History Page
          StringManager.ordersHistoryHeader: "Orders History",
          StringManager.ordersHistorySucceedButton: "Succeeded",
          StringManager.ordersHistoryFailedButton: "Failed",
          StringManager.ordersHistoryOrder: "Order",

          // Track orderes Page
          StringManager.tarckOrdersHeader: "Track Orders",
          StringManager.tarckOrdersOrder: "Order",
          StringManager.trackOrdersMenuEditText: "Edit",
          StringManager.trackOrdersMenuCancelText: "Cancel",

          //Upload Image
          StringManager.titleUploadPicture: "Choose your picture!",
          StringManager.subTitleUploadPicture: "Please choose a personal photo",
          StringManager.uploadPicture: "Upload Picture",
          StringManager.chooseUploadPicture: "Choose Picture",
          StringManager.submitPicture: "Upload",
          //Error
          StringManager.strNoInternetError:
              "No Connection, please check your internet connection and try again",
          //success
          StringManager.loginSuccess: "login is successful",
          StringManager.SingupSuccess: "Singup is successful",
          StringManager.loading: "Loading ...",
          // Common in Order pages
          StringManager.orderDetailsHeader: "Order Details",
          StringManager.orderDetailsId: "ID",
          StringManager.orderDetailsProductName: "Product",
          StringManager.orderDetailsUnitCount: "Count",
          StringManager.orderDetailsUnitPrice: "Price",
          StringManager.orderDetailsTotalPrice: "Total",
          StringManager.orderDetailsStatus: "Status",
          StringManager.orderDetailsDate: "Date",
          StringManager.orderDetailsAddress: "Address",
          StringManager.orderDetailsSyrianPounds: "SP",
          StringManager.ordersHistoryStatusCancelled : "Cancelled" , 
          StringManager.ordersHistoryStatusRejected : "Rejected" , 
          StringManager.ordersHistoryStatusCompleted : "Completed" , 
        },
      };
}
