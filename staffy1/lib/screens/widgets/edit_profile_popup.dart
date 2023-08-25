import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:staffy/models/user_model.dart';
import 'package:staffy/tools/constance.dart';
import 'package:staffy/view_model/auth_view_model.dart';
import 'package:staffy/view_model/profile_view_model.dart';
import 'package:get/get.dart';

class ProfilePopup extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController professionController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      edityourprofileheretext,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: primarycolor),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(hintText: nametext),
                ),
                TextFormField(
                  controller: professionController,
                  decoration: const InputDecoration(hintText: professiontext),
                ),
                TextFormField(
                  controller: phoneNumberController,
                  decoration: const InputDecoration(hintText: phonenumbertext),
                ),
                TextButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.red),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.yellow)),
                  onPressed: () {
                    if (nameController.text.isNotEmpty ||
                        professionController.text.isNotEmpty ||
                        phoneNumberController.text.isNotEmpty) {
                      UserModel updatedUserModel = UserModel(
                        userid: FirebaseAuth.instance.currentUser!.uid,
                        name: nameController.text,
                        phoneNumber: phoneNumberController.text,
                        profession: professionController.text,
                      );

                      Get.find<ProfileViewModel>()
                          .updateUserData(updatedUserModel);

                      Get.back();
                    }
                  },
                  child: const Text(savetext),
                ),
                const Text(
                  changeyouremailtext,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: primarycolor),
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: const InputDecoration(hintText: emailtext),
                ),
                TextFormField(
                  obscureText: true,
                  controller: confirmPasswordController,
                  decoration: const InputDecoration(
                      hintText: enteryourpasswordtoconfirmtext),
                ),
                TextButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.red),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.yellow)),
                  onPressed: () async {
                    if (emailController.text.isNotEmpty ||
                        confirmPasswordController.text.isNotEmpty) {
                      await AuthViewModel().changeEmail(
                          confirmPasswordController.text, emailController.text);
                      AuthViewModel().signout();
                    }
                  },
                  child: const Text(savetext),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 18),
                  child: Text(
                    changeyourpasswordheretext,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: primarycolor),
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(hintText: oldpasswordtext),
                ),
                TextFormField(
                  obscureText: true,
                  controller: newPasswordController,
                  decoration: const InputDecoration(hintText: newpasswordtext),
                ),
                const SizedBox(height: 16.0),
                TextButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.red),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.yellow)),
                  onPressed: () async {
                    if (newPasswordController.text.isNotEmpty ||
                        passwordController.text.isNotEmpty) {
                      String? result = await AuthViewModel.changePassword(
                          passwordController.text, newPasswordController.text);

                      if (result == null) {
                      } else {
                        print("Password change error: $result");
                      }

                      AuthViewModel().signout();
                    }
                  },
                  child: const Text(savetext),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
