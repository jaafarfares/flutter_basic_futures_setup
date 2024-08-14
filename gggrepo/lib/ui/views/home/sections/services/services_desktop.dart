import 'package:flutter/material.dart';

class ServicesDesktop extends StatelessWidget {
  final GlobalKey key;
  const ServicesDesktop({required this.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      height: 700,
      color: Colors.red,
    );
  }
}
