import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/route_manager.dart';
import 'package:staffy/screens/auth_view/register_page.dart';
import 'package:staffy/screens/custom_widgets/custom_flat_button.dart';
import 'package:staffy/screens/custom_widgets/custom_sizedbox.dart';
import 'package:staffy/screens/custom_widgets/custom_text.dart';
import 'package:staffy/screens/custom_widgets/custom_textfeild.dart';
import 'package:staffy/tools/constance.dart';
import 'package:staffy/view_model/auth_view_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(
                      text: welcometext,
                      fontSize: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.offAll(() => (RegisterScreen()));
                      },
                      child: const CustomText(
                        text: signuptext,
                        fontSize: 20,
                        color: primarycolor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const CustomText(
                  text: signintocontinuetext,
                  fontSize: 15,
                  color: greycolor,
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
                CustomSizedBox(height: 25),
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
                const CustomSizedBox(),
                const CustomText(
                  alignment: Alignment.topRight,
                  text: forgotpasswordtext,
                ),
                const CustomSizedBox(height: 25),
                CustomButton(
                  backgroundColor: primarycolor,
                  fontWeight: FontWeight.bold,
                  label: signintext,
                  onPressed: () {
                    _formkey.currentState!.save();

                    if (_formkey.currentState!.validate()) {
                      controller.SignInWithEmailAndPassword();
                    }
                  },
                ),
                const CustomSizedBox(height: 55),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: Divider(indent: 20, endIndent: 5)),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: CustomText(
                          text: useauthbuttons,
                        )),
                    Expanded(child: Divider(indent: 20, endIndent: 5)),
                  ],
                ),
                const CustomSizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // controller.signinwithfacebook();
                      },
                      child: const Icon(FontAwesomeIcons.facebook,
                          color: primarycolor, size: 30),
                    ),
                    const SizedBox(width: 15),
                    GestureDetector(
                      onTap: () {
                        // controller.signinwithgoogle();
                      },
                      child: const Icon(FontAwesomeIcons.google,
                          color: primarycolor, size: 30),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
