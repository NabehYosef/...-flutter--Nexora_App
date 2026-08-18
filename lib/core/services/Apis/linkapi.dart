class AppLink {
  //  static const String server =
  //       "http://localhost:5000/api";
  static const String server =
      "http://10.0.2.2:5000/api";
  //
  //      //"http://10.0.2.2:5000/api";
  // static const String server =
  //     "https://omnivore-politely-anaerobic.ngrok-free.dev/api";

  static const String register =
      "$server/register";
  //====================================
  static const String imagesBaseUrl =
      "http://10.0.2.2:5000";
  // static const String imagesBaseUrl =
  //     "https://omnivore-politely-anaerobic.ngrok-free.dev";
  //========================== Image ============================
  static const String
  imagestCategories =
      "$imagesBaseUrl/categories";
  static const String imagestItems =
      "$imagesBaseUrl/items";
  //=/================Auth==============
  static const String signup =
      "$server/auth/register";
  // ignore: constant_identifier_names
  static const String verifyOtp =
      "$server/auth/verify";
  static const String login =
      "$server/auth/login";
  static const String forgetpassword =
      "$server/auth/forgotPassword";
  static const String resetpassword =
      "$server/auth/resetPassword";
  static const String logout =
      "$server/auth/logout";
  static const String resendotp =
      "$server/auth/resendOtp";
  //==============================================
  //Home User
  static const String home =
      "$server/home";
  //=================Product==============
  static const String products =
      "$server/product/products";
  static const String filterProducts =
      "$server/product/filter";
  //=================Favorite==============
  static const String addToFavourite =
      "$server/user/addToFavourite";
  static const String
  removeFromFavourite =
      "$server/user/removeFromFavourite";
  static const String
  showFavouriteList =
      "$server/user/favouriteList";
  //=================Category==============
  static const String categories =
      "$server/product/categories";
  //=================Cart==============
  static const String showUserCart =
      "$server/cart/userCart";
  static const String addToCart =
      "$server/cart/addToCart";
  static const String removeCartItem =
      "$server/cart/removeitem";
  static const String
  updateCartQuantity =
      "$server/cart/updateQuantity";
  static const String clearCart =
      "$server/cart/clearCart";
  static const String cartTotalItems =
      "$server/cart/totalItems";
  //=================Address==============
  static const String addressAdd =
      "$server/user/addAddress";
  static const String governorates =
      "$server/user/governorates";
  static const String addressView =
      "$server/user/addresses";
  static const String addressDelete =
      "$server/user/deleteAddress";
  static const String profile =
      "$server/user/profile";
  static const String updateUser =
      "$server/user/updateUser";
  //=================Order==============
  static const String createOrder =
      "$server/order/createOrder";
  static const String userOrders =
      "$server/order/userOrders";
  static const String singleOrder =
      "$server/order/singleOrder";
  static const String cancelOrder =
      "$server/order/cancelOrder";
}

//nabeh12
//nabeh1212@gmail.com
//2345678900
//0987654321
//11/9/1999
/*
nabeh12
nabeh1212@gmail.com
2345678900
0987654321
11-9-1999
*/
