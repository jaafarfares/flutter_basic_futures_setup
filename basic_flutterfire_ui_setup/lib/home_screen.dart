import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.user,
  });
  final User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text('home screen')),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Text(user.uid),
              // Text(user.displayName!),
              Text(
                user.email!,
                style: TextStyle(fontSize: 20),
              ),
              Spacer(),
              const SignOutButton(),
              Spacer(),
            ],
          ),
        ));
  }
}
