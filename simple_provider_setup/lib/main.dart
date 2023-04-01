import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_Model_provider.dart';
import 'change_user_data.dart';

void main() => runApp(ChangeNotifierProvider<UserModel>(
      create: (context) => UserModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: user(),
      ),
    ));

class user extends StatefulWidget {
  @override
  State<user> createState() => _userState();
}

class _userState extends State<user> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade300,
      body: Center(
        child: Consumer<UserModel>(
          builder: (context, userModel, child) {
            return Column(
              children: [
                const Spacer(),
                Text(
                  userModel.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox(height: 10),
                Text(userModel.lastName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25)),
                const SizedBox(height: 10),
                Text(userModel.age.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25)),
                const SizedBox(height: 18),
                UpdateButton(),
                const Spacer(),
              ],
            );
          },
        ),
      ),
    );
  }
}
