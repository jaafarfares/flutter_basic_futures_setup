import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/user_Model_provider.dart';
import 'user_Model_provider.dart';
import 'main.dart';

class UpdateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userModel = (context).read<UserModel>();
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.grey[400],
        onPrimary: Colors.black,
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            String name = userModel.name;
            String lastName = userModel.lastName;
            String age = userModel.age.toString();
            return AlertDialog(
              title: Text('Update Your Info'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    onChanged: (value) {
                      name = value;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Name',
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    onChanged: (value) {
                      lastName = value;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Last Name',
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    onChanged: (value) {
                      age = value;
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Age',
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('CANCEL'),
                ),
                TextButton(
                  onPressed: () {
                    userModel.updateuser(name, lastName, age);
                    Navigator.pop(context);
                  },
                  child: const Text('Update'),
                ),
              ],
            );
          },
        );
      },
      child: const Icon(
        Icons.settings,
        color: Colors.grey,
      ),
    );
  }
}
