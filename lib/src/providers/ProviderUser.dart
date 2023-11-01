import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:multi_screen_app/src/models/ApiResponse.dart';
import 'package:multi_screen_app/src/providers/BaseAPI.dart';
import 'package:multi_screen_app/src/models/ModelUser.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProviderUser extends ChangeNotifier {
  bool _loading = false;
  ModelUser _user;
  static const storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true)
  );

  ProviderUser(): _user = ModelUser.notSignedIn();

  Future<String?> signIn (String email, String password) async {
    _loading = true;

    // push data
    final http.Response httpResult = await http.post(
        Uri.https(BaseAPI.authority, BaseAPI.routes['signIn']!, null),
        headers: BaseAPI.headers,
        body: _ModelSignIn(email, password).toJSON()
    );

    // evaluate response
    final response = ApiResponse.fromJson(jsonDecode(httpResult.body));
    if (response.isSuccess()) {
      _user = ModelUser(response.results);

      await storage.write(key: 'jwt', value: _user.token);
      return null;
    }

    _loading = false;
    return response.message;
  }
  Future<String?> signUp (String email, String password, DateTime? bornDate, String? phone, bool acceptPromotions) async {
    _loading = true;

    // push data
    final http.Response httpResult = await http.post(
        Uri.https(BaseAPI.authority, BaseAPI.routes['signUp']!, null),
        headers: BaseAPI.headers,
        body: _ModelSignUp(email, password, bornDate, phone, acceptPromotions).toJSON()
    );

    // evaluate response
    final response = ApiResponse.fromJson(jsonDecode(httpResult.body));
    if (response.isSuccess()) {
      return null;
    }

    _loading = false;
    return response.message;
  }
  Future<void> signOut () async {
    _user = ModelUser.notSignedIn();
    await storage.delete(key: 'jwt');
  }
  Future<String?> recoveryPassword (String email) async {
    _loading = true;

    // push data
    final http.Response httpResult = await http.post(
        Uri.https(BaseAPI.authority, BaseAPI.routes['password-recovery']!, null),
        headers: BaseAPI.headers,
        body: _ModelRecoveryPassword(email).toJSON()
    );

    // evaluate response
    final response = ApiResponse.fromJson(jsonDecode(httpResult.body));
    if (response.isSuccess()) {
      return null;
    }

    _loading = false;
    return response.message;
  }
  Future<bool> testStoredJWT() async {
    String? jwt = await storage.read(key: 'jwt');

    if (jwt != null) {
      _user = ModelUser(jwt);
      return true;
    }

    return false;
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

class _ModelSignUp {
  final String _email;
  final String _password;
  final DateTime? _bornDate;
  final String? _phone;
  final bool _acceptPromotions;

  _ModelSignUp(this._email, this._password, this._bornDate, this._phone, this._acceptPromotions);

  String toJSON () {
    return jsonEncode(<String, dynamic> {
      'email': _email,
      'password': _password,
      'bornDate': _bornDate?.millisecond,
      'phone': _phone,
      'acceptPromotions': _acceptPromotions,
      'acceptTerms': true
    });
  }
}

class _ModelRecoveryPassword {
  final String _email;

  _ModelRecoveryPassword(this._email);

  String toJSON () {
    return jsonEncode(<String, dynamic> {
      'email': _email
    });
  }
}
