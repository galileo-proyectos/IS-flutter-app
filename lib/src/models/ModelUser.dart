import 'package:flutter/cupertino.dart';

class ModelUser extends ChangeNotifier {
  String _token;

  ModelUser.notSignedIn () : _token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiZW1haWwiOiJBbGVzc2FuZHJvLm1vcmFsZXNAZ2FsaWxlby5lZHUiLCJpYXQiOjE2OTY4Njk1NDB9.P5oNhEokteuvPz8IzUoK1J1IC2X9rwEE9gchkiksFhs';
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
