import 'package:flutter/material.dart';
// used as a singleton class cuz need to keep only one instance of these objects

class UserData with ChangeNotifier {
  static UserData? _instance;
  UserData._();

  // public method to make the instance of the class
  // this will only make one instance of the class
  static UserData get instance {
    // this will check if and assign a instance if only the current is null
    return _instance ??= UserData._();
  }

  // this variable will keep the login status all over the application
  bool _isUserLoggedIn = false;

  bool get isUserLoggedIn => _isUserLoggedIn;

  set isUserLoggedIn(bool value) {
    _isUserLoggedIn = value;
    notifyListeners();
  }
}
