import 'package:flutter/material.dart';
import 'change_user_data.dart';

class UserModel with ChangeNotifier {
  String _name = "Jaafar";
  String _lastName = "Fares";
  int _age = 22;

  String get name => _name;
  set name(String value) {
    _name = value;
    notifyListeners();
  }

  String get lastName => _lastName;
  set lastName(String value) {
    _lastName = value;
    notifyListeners();
  }

  int get age => _age;
  set age(int value) {
    _age = value;
    notifyListeners();
  }

  void updateuser(name, lastname, age) {
    _name = name;
    _lastName = lastName;
    _age = int.parse(age);
    notifyListeners();
  }
}
