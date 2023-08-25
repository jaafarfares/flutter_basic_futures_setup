import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staffy/screens/chat_page.dart';
import 'package:staffy/screens/home_page.dart';
import 'package:staffy/screens/profile_page.dart';

class ChatViewModel extends GetxController {
  var name = 'jaafar';
  dosomething() {
    name = 'kimo';
    update();
  }
}
