/* import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'home_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (!snapshot.hasData) {
            return Container(
              child: SignInScreen(
                providerConfigs: [
                  EmailProviderConfiguration(),
                  GoogleProviderConfiguration(
                      clientId:
                          "1:608143979880:android:eae74326854927f8e952dd"),
                  FacebookProviderConfiguration(
                      clientId: "1:608143979880:android:eae74326854927f8e952dd")
                ],
              ),
            );
          }
          return HomeScreen(user: snapshot.data!);
        }));
  }
}
 */
