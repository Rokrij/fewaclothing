import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAuthProvider extends ChangeNotifier {
  String email = '';
  getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email') ?? "";
    notifyListeners();
  }

  void saveEmail(String email) async {
    this.email = email;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    notifyListeners();
  }
}
