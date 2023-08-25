import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staffy/screens/chat_page.dart';
import 'package:staffy/screens/home_page.dart';
import 'package:staffy/screens/profile_page.dart';

class ControlViewModel extends GetxController {
  int _navigatorvalue = 0;

  get navigatorvalue => _navigatorvalue;

  Widget _currentscreen = HomePage();

  get currentscreen => _currentscreen;

  void changeselectedvalue(int selectedvaue) {
    _navigatorvalue = selectedvaue;
    switch (selectedvaue) {
      case 0:
        {
          _currentscreen = HomePage();
          break;
        }
      case 1:
        {
          _currentscreen = ChatPage();
          break;
        }
      case 2:
        {
          _currentscreen = ProfilePage();
          break;
        }
    }
    update();
  }
}
