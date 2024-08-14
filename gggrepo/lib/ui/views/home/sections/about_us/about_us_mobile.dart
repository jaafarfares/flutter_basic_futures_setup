import 'package:flutter/material.dart';






class AboutUsMobile extends StatelessWidget {
  const AboutUsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      color: Colors.yellow,
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