class BaseAPI {
  // [Q] how can I set ENV variables????
  static const String authority = 'scango.alssdev.com';
  static const _api = '/api/v1';

  static const headers = <String, String> {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  static const Map<String, String> routes = {
    'signIn': '$_api/auth/signin',
    'signUp': '$_api/auth/signup',
    'categories': '$_api/categories',
    'password-recovery': '$_api/password-recovery/send-email',
    'products': '$_api/products',
    'promotions': '$_api/promotions',
    'cart': '$_api/cart'
  };

  static Map<String, String> authHeaders (String token) {
    final tempHeaders = Map.of(headers);
    tempHeaders.addAll(<String, String>{
      "Authorization": token
    });
    return tempHeaders;
  }
}
