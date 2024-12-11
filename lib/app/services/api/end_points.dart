class EndPoints {
  static const String baserUrl = "http://192.168.1.10:8000/api";
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
  static const String generateVerificationCode =
      "/users/generateVerificationCode";
  // Locations
  static const String addLocation = "/locations/addLocation";
  static const String getLocations = "/locations/getLocations";
  static const String deleteLocation =
      "/locations/deleteLocation/"; //{location_id}
  // Orders
  static const String createOrder = "/orders/createOrder";
  static const String editOrder = "/orders/editOrder/"; // {order}
  static const String cancelOrder = "/orders/cancelOrder/"; // {order}
  static const String deleteProduct =
      "/orders/deleteProduct/"; // {order}/{product}
  static const String getOrders = "/orders/getOrders";
  static const String getOrdersByStatus =
      "/orders/getOrdersByStatus/"; //{status}
  // 1 for succeeded ones
  static const String getOrder = "/orders/getOrder/"; //{order}

  // Markets
  static const String getMarkets = "/markets/getMarkets";
  static const String getMarketsByName =
      "/markets/getMarketsByName/"; //{market_name}
  static const String getProductsForMarket =
      "/markets/getProductsForMarket/"; //{market}

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
  //---------------------------------------
  static String date = "date";
  static String orders = "orders";
  static String price = "price";
  static String total = "total";
  static String count = "count";
  static String markets = "markets";
  static String products = "products";
  static String location_name = "location_name";
  static String total_cost = "total_cost";
  static String status_id = "status_id";
  //---------------------------------------
}
