import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staffy/models/user_model.dart';
import 'package:staffy/screens/auth_view/login_page.dart';
import 'package:staffy/screens/auth_view/on_holed_screen.dart';
import 'package:staffy/screens/home_page.dart';
import 'package:staffy/tools/constance.dart';
import 'package:staffy/view_model/auth_view_model.dart';
import 'package:staffy/view_model/controll_view_model.dart';
import 'package:staffy/view_model/profile_view_model.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginScreen()
          : GetBuilder<ControlViewModel>(
              init: ControlViewModel(),
              builder: (controller) => Scaffold(
                body: controller.currentscreen,
                bottomNavigationBar: bottomNavigationBar(),
              ),
            );
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) => BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text('Home'),
            ),
            label: ' ',
            icon: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Icon(
                Icons.home,
                color: primarycolor,
              ),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text('Chat\'s'),
            ),
            label: '  ',
            icon: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Icon(
                Icons.chat_bubble_outline,
                color: primarycolor,
              ),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text('Profile'),
            ),
            label: ' ',
            icon: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Icon(
                Icons.person_outline,
                color: primarycolor,
              ),
            ),
          ),
        ],
        currentIndex: controller.navigatorvalue,
        onTap: (index) {
          controller.changeselectedvalue(index);
        },
        elevation: 0,
      ),
    );
  }
}


/* class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initializeView(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while fetching user data
          return const Center(
            child: CircularProgressIndicator(
              color: primarycolor,
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error occurred while loading data'),
          );
        } else {
          return Obx(() {
            final auth = Get.find<ProfileViewModel>();
            if (auth.userModel == null) {
              return LoginScreen();
            } else if (auth.userModel!.accepted == false) {
              return const OnHoledPage();
            } else {
              return GetBuilder<ControlViewModel>(
                init: ControlViewModel(),
                builder: (controller) => Scaffold(
                  body: controller.currentscreen,
                  bottomNavigationBar: bottomNavigationBar(),
                ),
              );
            }
          });
        }
      },
    );
  }
    Future<void> _initializeView() async {
    final auth = Get.find<ProfileViewModel>();
    if (auth.userModel == null) {
      await auth.getUserData(FirebaseAuth.instance.currentUser!.uid);
    }
  }
 */
