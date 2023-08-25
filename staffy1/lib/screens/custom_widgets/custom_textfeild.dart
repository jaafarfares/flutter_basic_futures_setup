import 'package:flutter/material.dart';
import 'package:staffy/screens/custom_widgets/custom_text.dart';
import 'package:staffy/tools/constance.dart';

class CustomTextFromFeild extends StatelessWidget {
  const CustomTextFromFeild(
      {this.text = '',
      this.hinttext = '',
      this.onSave,
      this.obscureText = false,
      this.maxLength = 24,
      this.validator,
      this.keyboardType = TextInputType.emailAddress});
  final String text;
  final bool obscureText;
  final String hinttext;
  final int maxLength;
  final void Function(String?)? onSave;
  final String? Function(String?)? validator;
  final keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
            text: text,
            color: blackcolor,
          ),
          TextFormField(
            keyboardType: keyboardType,
            maxLength: maxLength,
            obscureText: obscureText,
            onSaved: onSave,
            validator: validator,
            decoration: InputDecoration(
                hintText: hinttext,
                hintStyle: const TextStyle(color: greycolor),
                fillColor: whitecolor),
          ),
        ],
      ),
    );
  }
}
