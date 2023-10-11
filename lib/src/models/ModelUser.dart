

class ModelUser {
  final String _token;

  ModelUser.notSignedIn(): _token = ''; // named constructor
  ModelUser(this._token);

  String get token => _token;

  bool isLoggedIn () => _token.isNotEmpty;

  @override
  String toString () => '(USER)[\n  token: $_token\n]';
}
