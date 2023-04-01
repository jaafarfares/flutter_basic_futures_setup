import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_facebook/firebase_ui_oauth_facebook.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:testt/home_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
/*   FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
    GoogleProvider(
        clientId:
            '608143979880-avmf1td2he36grs24qe07rmh7fs1bqtq.apps.googleusercontent.com'),
  ]);
 */
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignInScreen(
        providers: [
          EmailAuthProvider(),
          FacebookProvider(
              clientId:
                  '608143979880-avmf1td2he36grs24qe07rmh7fs1bqtq.apps.googleusercontent.com'),
          GoogleProvider(
              clientId:
                  '608143979880-avmf1td2he36grs24qe07rmh7fs1bqtq.apps.googleusercontent.com'),
        ],
        actions: [
          AuthStateChangeAction<SignedIn>((context, state) {
            // redirect to other screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          })
        ],
      ),
    );
  }
}
