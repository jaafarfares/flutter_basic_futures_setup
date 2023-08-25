import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/route_manager.dart';
import 'package:staffy/screens/auth_view/login_page.dart';
import 'package:staffy/screens/custom_widgets/custom_flat_button.dart';
import 'package:staffy/screens/custom_widgets/custom_sizedbox.dart';
import 'package:staffy/screens/custom_widgets/custom_text.dart';
import 'package:staffy/screens/custom_widgets/custom_textfeild.dart';
import 'package:staffy/tools/constance.dart';
import 'package:staffy/view_model/auth_view_model.dart';

class RegisterScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Get.offAll(() => (LoginScreen())),
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: signuptext,
                      fontSize: 30,
                    ),
                  ],
                ),
                CustomSizedBox(height: 25),
                CustomTextFromFeild(
                  hinttext: namehinttext,
                  text: nametext,
                  onSave: (String? value) {
                    controller.name = value!;
                  },
                  validator: (String? value) {
                    if (value == null) {
                      print("ERROR: Email feild null");
                    }
                  },
                ),
                const CustomSizedBox(height: 25),
                CustomTextFromFeild(
                  hinttext: hintemailtext,
                  text: emailtext,
                  onSave: (String? value) {
                    controller.email = value!;
                  },
                  validator: (String? value) {
                    if (value == null) {
                      print("ERROR: Email feild null");
                    }
                  },
                ),
                CustomTextFromFeild(
                  hinttext: 'kToA4UbSVCsjNgEYuQpJ',
                  text: 'add your company UID',
                  onSave: (String? value) {
                    controller.companyUID = value!;
                  },
                  validator: (String? value) {
                    if (value == null) {
                      print("ERROR: Email feild null");
                    }
                  },
                ),
                const CustomSizedBox(height: 25),
                CustomTextFromFeild(
                  obscureText: true,
                  hinttext: passwordhinttext,
                  text: passwordtext,
                  onSave: (String? value) {
                    controller.password = value!;
                  },
                  validator: (String? value) {
                    if (value == null) {
                      print("ERROR: password feild null");
                    }
                  },
                ),
                const CustomSizedBox(height: 25),
                CustomButton(
                  backgroundColor: primarycolor,
                  fontWeight: FontWeight.bold,
                  label: signuptext,
                  onPressed: () {
                    _formkey.currentState!.save();

                    if (_formkey.currentState!.validate()) {
                      controller.CreateAccountWithEmailAndPassword();
                    }
                  },
                ),
                const CustomSizedBox(height: 55),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
