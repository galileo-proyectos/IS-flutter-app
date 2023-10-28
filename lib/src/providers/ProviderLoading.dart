import 'package:flutter/cupertino.dart';

class ProviderLoading extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  void setLoading(bool value) {
    if (_isLoading != value) {
      _isLoading = value;
      notifyListeners();
    }
  }
}
