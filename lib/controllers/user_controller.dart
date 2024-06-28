import 'package:flutter/material.dart';
import 'package:lesson_65_1/models/user.dart';

class UserController extends ChangeNotifier {
  User? user;

  void update(String name, String imageUrl) {
    if (user == null) {
      user = User(name: name, imageUrl: imageUrl);
    } else {
      user!.name = name;
      user!.imageUrl = imageUrl;
    }
    notifyListeners();
  }
}
