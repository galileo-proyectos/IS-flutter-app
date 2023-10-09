import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:multi_screen_app/src/models/ApiResponse.dart';
import 'package:multi_screen_app/src/models/ModelUser.dart';
import 'package:multi_screen_app/src/providers/BaseAPI.dart';

class ProviderUser extends ChangeNotifier {
  bool _loading = false;
  ModelUser _user;

  ProviderUser(): _user = ModelUser.notSignedIn();

  Future<String?> signIn (String email, String password) async {
    _loading = true;

    // fetch
    final http.Response httpResult = await http.post(
        Uri.parse('${BaseAPI.routes['auth']}/signin'),
        headers: BaseAPI.headers,
        body: _ModelSignIn(email, password).toJSON()
    );

    // evaluate response
    final response = ApiResponse.fromJson(jsonDecode(httpResult.body));
    if (response.isSuccess()) {
      _user = ModelUser(response.results);
      return null;
    }

    _loading = false;
    return response.message;
  }

  bool isLoading () => _loading;
  ModelUser get user => _user;
}

class _ModelSignIn {
  final String _email;
  final String _password;

  _ModelSignIn(this._email, this._password);

  String toJSON () {
    return jsonEncode(<String, String> {
      'email': _email,
      'password': _password
    });
  }
}
