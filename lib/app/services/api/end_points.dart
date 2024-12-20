class EndPoints {
  static const String baserUrl = "http://192.168.1.16:8000/api";
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
  static const String getLocation = "/locations/getLocation/"; //{location}
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

  // Products
  static const String toggleFavorite = "/products/toggleFavorite/"; //{product}/
  static const String getFavoriteProducts = "/products/getFavoriteProducts";
  static const String getProducts = "/products/getProducts";
  static const String getProductsByCategory =
      "/products/getProductsByCategory/"; //{category}
  static const String getProduct = "/products/getProduct/"; //{product}
  static const String getProductsByName =
      "/products/getProductsByName/"; //{product_name}
  static const String getImageProduct = "/products/getImage/"; //{product}
  // Category
  static const String getAllCategories = "/categories/getAll";
  static const String getCategory = "/categories/get/{category}";
  // Carts
  static const String addProductInCart = "/carts/addProduct/"; //{product}
  static const String plusProductOneCart = "/carts/plusProductOne/"; //{product}
  static const String minusProductOneCart =
      "/carts/minusProductOne/"; //{product}
  static const String deleteProductCart = "/carts/deleteProduct/"; //{product}
  static const String clearCart = "/carts/clearCart";
  static const String getCart = "/carts/getCart";

  static const String test = "";
}

class ApiKey {
  static String id = "id";
  static String category = "category";
  static String name = "name";
  static String name_en = "name_en";
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
  static String user = "user";
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
  static String locations = "locations";
  static String old_password = "old_password";
  static String new_password = "new_password";
  static String new_password_confirmation = "new_password_confirmation";
  static String image_path = "image_path";

  static String categories = "categories";
  static String image = "image";
  static String market_name = "market_name";
  static String category_name = "category_name";
  static String market_id = "market_id";
  static String currentPageItems = "currentPageItems";
  static String perPage = "perPage";
  static String page = "page";

  //---------------------------------------
}
