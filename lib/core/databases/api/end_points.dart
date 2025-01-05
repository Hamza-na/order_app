class EndPoints {
  static const String baserUrl = "http://192.168.153.73:8000/api";
  static const String signUp = "/auth/register";
  static const String login = "/auth/login";
  static const String user = "users/";
  static const String logOut = "/auth/logOut";
  static const String markets = "/markets";
  static const String products = "/products";
  static const String addToCart= "/cart/add_to_cart";
  static const String addToFavorite= "/products/add_to_favorites";
  static const String removeFromFavorite= "/products/remove_from_favorites";
  static const String getCart= "/cart/products";
  static const String removeProductFromCart =  "/cart/remove_from_cart";
  static const String orders =  "/orders/";
  static const String removeOrder =  "/orders/delete";
  static const String orderDelivared=  "/orders/delivered";
  static const String restoreOrder=  "/orders/restore";
  static const String refreshToken  = "/auth/refresh";
  static const String orderCart  = "/cart/order";
  static const String updateProfile = "/auth/update_profile";
  static const String favoriteProducts = "/products/favorites";
  static const String searchForMarkets = "/markets/search";
  static const String toUser = "/auth/user"; 
  static const String toAdmin = "/auth/admin"; 
  static const String deleteCart = "/cart/delete"; 
  static const String orderUpdated = "/orders/update"; 
  static const String orderConfirmation = "/orders/period_of_editing_has_finished"; 
  static const String adminResponse = "/orders/admin_response"; 
  static const String me = "/auth/me"; 
}

class ApiKey {
  static String name = "name";
  static String phoneNumber = "phone_number";
  static String phoneNumberConfirmation = "phone_number_confirmation";
  static String location = "location";
  static String image = "image";
  static String description = "description";
  static String method = "_method";
  static String favoriteProducts = "favorite_products";
  static String fcmToken = "fcm_tokens";
  static String language = "lang";


  static String message = "message";
  static String messageAr = "message";
  static String accessToken = "access_token";
  static String token = "token";
  static String tokenType = "token_type";
  static String expiresIn = "expires_in";

  static String refreshToken = "refresh_token";

  static String user = "user";
  static String role = "role";
  static String updatedAt = "updated_at";
  static String createdAt = "created_at";
  static String id = "id";

  static String market = "market";
  static String markets = "markets";

  static String imageOfMarket = "image_of_market";
  static String price = "price";
  static String availableQuantity = "available_quantity";
  static String marketId = "market_id";
  static String imageOfProduct = "image_of_product";
  static String product = "product";

  static String numberOfProductsInCart = "number_of_products_in_the_cart";


  static String productId = "product_id";
  static String quantity = "quantity";
  static String priceForOnePiece = "price_for_one_piece";
  static String totalPrice = "total_price";
  static String products = "products";
  static String cart = "cart";
  static String bill = "bill";
  static String rejectedAt = "rejected_at";
  static String status = "status";

  static String userId = "user_id";
  static String orders = "orders";

  static String order = "order";
  static String newAccessToken= "new_access_token";



}
