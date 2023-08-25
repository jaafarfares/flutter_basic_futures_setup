import 'package:flutter/material.dart';
import 'package:staffy/screens/auth_view/controll_view.dart';
import 'package:staffy/tools/constance.dart';
import 'package:staffy/view_model/auth_view_model.dart';
import 'package:staffy/view_model/controll_view_model.dart';
import 'package:staffy/view_model/profile_view_model.dart';

class OnHoledPage extends StatelessWidget {
  const OnHoledPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("on Hold screen"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () async {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          alignment: Alignment.center,
                          title: Text('messsage'),
                          content: Text('the admin still didnt accept you yet'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        ));
              },
              child: const Text('Refresh'),
            ),
            const Center(
                child: Text("wait untill the admin accept you to the app")),
            ElevatedButton(
              onPressed: () {
                ProfileViewModel().signout();
              },
              child: const Text('logout '),
            ),
          ],
        ));
  }
}
