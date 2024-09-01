import 'package:flutter/material.dart';
import 'package:instagram/models/user.dart';
import 'package:instagram/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  User? _user; // User object can be null
  final AuthMethods _authMethods = AuthMethods();

  // Getter for user
  User? get getUser => _user;

  // Method to refresh and fetch user details
  Future<void> refreshUser() async {
    try {
      User? user = await _authMethods.getUserDetails();
      _user = user;
      notifyListeners(); // Notify listeners about changes
    } catch (e) {
    }
  }
}