import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  String _userName = '';

  bool get isLoggedIn => _isLoggedIn;
  String get userName => _userName;

  void login(String email) {
    _userName = email.split('@').first;
    _isLoggedIn = true;
    notifyListeners();
  }

  void register(String name, String email) {
    _userName = name;
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    _userName = '';
    _isLoggedIn = false;
    notifyListeners();
  }
}
