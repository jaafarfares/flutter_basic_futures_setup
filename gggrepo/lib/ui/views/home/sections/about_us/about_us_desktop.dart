// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AboutUsDesktop extends StatelessWidget {
  final GlobalKey key;

  const AboutUsDesktop({
    required this.key,
  }) : super(key: key);


  
  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      color: Colors.blue,
      height: 500,
      child: const  Center(
        child: Column(
          children: [
            Text(
              'About us',
              style: TextStyle(
                fontSize: 50,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
