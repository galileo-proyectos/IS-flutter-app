class BaseAPI {
  // [Q] how can I set ENV variables????
  static const String _base = 'https://scango.alssdev.com';
  static const _api = '$_base/api/v1';

  static const headers = <String, String> {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  static const Map<String, String> routes = {
    'auth': '$_api/auth',
    'categories': '$_api/aisles',
    'password-recovery': '$_api/password-recovery/send-email',
    'products': '$_api/products',
    'promotions': '$_api/promotions'
  };

  static Map<String, String> authHeaders (String token) {
    final tempHeaders = Map.of(headers);
    tempHeaders.addAll(<String, String>{
      "Authorization": token
    });
    return tempHeaders;
  }
}
