import 'package:flutter/material.dart';




class ContactUsDesktop extends StatelessWidget {
  final GlobalKey key;

  const ContactUsDesktop({required this.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      height: 700,
      color: Colors.green,
    );
  }
}