
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:staffy/view_model/auth_view_model.dart';
import 'package:staffy/view_model/chat_view_model.dart';
import 'package:staffy/view_model/controll_view_model.dart';
import 'package:staffy/view_model/profile_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => ProfileViewModel());
    Get.lazyPut(() => ChatViewModel());

  }
}
