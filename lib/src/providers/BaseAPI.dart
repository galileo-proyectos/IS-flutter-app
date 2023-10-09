class BaseAPI {
  // [Q] how can I set ENV variables????
  static const String _base = "https://scango.alssdev.com";
  static const _api = '$_base/api/v1';

  static const Map<String, String> routes = {
    'auth': '$_api/auth',
    'categories': '$_api/aisles'
  };

  static Map<String, String> headers (String token) {
    return {
      "Content-Type": "application/json; charset=UTF-8",
      "Authorization": token
    };
  }
}
