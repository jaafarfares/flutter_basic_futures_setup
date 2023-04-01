import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutterfire_ui/auth.dart';

import 'home_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    const clientid =
        '608143979880-avmf1td2he36grs24qe07rmh7fs1bqtq.apps.googleusercontent.com';
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (!snapshot.hasData) {
            return const SignInScreen(
              providerConfigs: [
                EmailProviderConfiguration(),
                GoogleProviderConfiguration(clientId: clientid),
              ],
            );
          }
/* 
                  GoogleProviderConfiguration(
                      clientId:
                          "608143979880-hrvusheq11hiijsjt6l6quef2km413r5.apps.googleusercontent.com"),
                  FacebookProviderConfiguration(
                      clientId:
                          "608143979880-hrvusheq11hiijsjt6l6quef2km413r5.apps.googleusercontent.com"), */
          return HomeScreen(user: snapshot.data!);
        }));
  }
}
