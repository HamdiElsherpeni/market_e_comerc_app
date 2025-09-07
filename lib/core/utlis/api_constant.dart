class ApiConstant {
  static const String _baseUrl = 'https://marketi-app.onrender.com/api/v1/';
  static const String sinUp = '${_baseUrl}auth/signUp';
  static const String sinIn = '${_baseUrl}auth/signIn';

  static const String sendPassEmail = '${_baseUrl}auth/sendPassEmail';
  static const String activResetPassEmail = '${_baseUrl}auth/activeResetPass';
  static const String createNewPassEmail = '${_baseUrl}auth/resetPassword';

  static const String products = '${_baseUrl}home/products';
  static const String brands = '${_baseUrl}home/brands';
  static const String categores = '${_baseUrl}ome/categories';
  static const String bannars = '${_baseUrl}home/banners';
  static const String topSeaech = '${_baseUrl}home/topSearch';
  static const String addproduct = '${_baseUrl}user/addProduct';
  static const String editeProduct = '${_baseUrl}user/editProduct';
  static const String deliteProduct = '${_baseUrl}user/deleteProduct';
  static const String getCarrt = '${_baseUrl}user/getCart';
  static const String addCart = '${_baseUrl}user/addCart';
  static const String deletCart = '${_baseUrl}user/deleteCart';
  static const String getFavorite = '${_baseUrl}user/getFavorite';
  static const String addFavorite = '${_baseUrl}user/addFavorite';
  static const String deletFavorite = '${_baseUrl}user/deleteFavorite';
  static const String addRate = '${_baseUrl}user/addRate';
  static const String checkOut = '${_baseUrl}user/checkout';
  static const String buyAgain = '${_baseUrl}user/getBuyAgain';
  static const String userData = '${_baseUrl}portfoilo/userData';
  static const String addImage = '${_baseUrl}portfoilo/userData';
  static const String editUser = '${_baseUrl}portfoilo/editUserData';
}
