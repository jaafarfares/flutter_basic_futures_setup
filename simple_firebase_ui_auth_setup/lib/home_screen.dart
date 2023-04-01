import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class homescreen extends StatelessWidget {
  const homescreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            GestureDetector(
/*                 onTap: () {
                  Navigator.pop(context, true);
                }, */
                child: const SignOutButton()),
          ],
        ),
      ),
    );
  }
}
