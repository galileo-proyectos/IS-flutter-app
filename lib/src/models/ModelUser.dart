import 'package:flutter/cupertino.dart';

class ModelUser extends ChangeNotifier {
  String _token;

  ModelUser.notSignedIn () : _token = '';
  ModelUser(this._token);

  String get token => _token;

  bool isLoggedIn () {
    return _token.isNotEmpty;
  }

  void signIn (ModelUser user) {
    _token = user.token;
    notifyListeners();
  }
  void signOut () {
    _token = '';
    notifyListeners();
  }

  @override
  String toString () => '(USER)[\n  token: $_token\n]';
}
