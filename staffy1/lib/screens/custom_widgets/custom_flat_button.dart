import 'package:flutter/material.dart';
import 'package:staffy/screens/custom_widgets/custom_text.dart';
import 'package:staffy/tools/constance.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final double fontSize;
  final Color color;
  final Alignment alignment;
  final FontWeight fontWeight;
  final EdgeInsets padding;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = whitecolor,
    this.fontSize = 15,
    this.color = blackcolor,
    this.alignment = Alignment.center,
    this.fontWeight = FontWeight.normal,
    this.padding = const EdgeInsets.all(0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: CustomText(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        text: label,
        alignment: alignment,
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(padding),
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
      ),
    );
  }
}
