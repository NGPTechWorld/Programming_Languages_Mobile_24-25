class EndPoints {
  static const String baserUrl = "http://192.168.137.69:8000/api";
  static const String registerUrl = "/users/register";
  static const String loginUrl = "/users/login";
  static const String logoutUrl = "/users/logout";
  static const String forgetPasswordUrl = "/users/forgetPassword";
  static const String verifyNumberUrl = "/users/verifyNumber";
  static const String verifyNewPassword = "/users/verifyNewPassword";
  static const String uploadImage = "/users/uploadImage";
  static const String setPassword = "/users/setPassword";
  static const String resetPassword = "/users/resetPassword";
  static const String editUser = "/users/editUser";
  static const String refreshToken = "/users/refreshToken";
  static const String currentUser = "/users/currentUser";
  static const String getImage = "/users/getImage";
  static const String deleteImage = "/users/deleteImage";
  static const String generateVerificationCode = "/users/generateVerificationCode";
  // Locations
  static const String addLocation = "/locations/addLocation";
  static const String getLocations = "/locations/getLocations";
  static const String deleteLocation =
      "/locations/deleteLocation/"; //{location_id}
  
  static const String test = "";
}

class ApiKey {
  static String id = "id";
  static String name = "name";
  static String email = "email";
  static String first_name = "first_name";
  static String last_name = "last_name";
  static String number = "number";
  static String password = "password";
  static String password_confirmation = "password_confirmation";
  static String message = "message";
  static String bearerToken = "Bearer Token";
  static String errors = "errors";
  static String userName = "user_name";
  static String validationFailed = "Validation failed";
  static String verify_code = "verify_code";
  static String location = "location";
  static String street = "street";
  static String notes = "notes";
}
