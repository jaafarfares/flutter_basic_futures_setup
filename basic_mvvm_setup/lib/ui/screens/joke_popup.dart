import 'package:basic_mvvm_setup/models/joke_model.dart';
import 'package:basic_mvvm_setup/repositories/jokes/joke_repositories.dart';
import 'package:flutter/material.dart';
import 'package:basic_mvvm_setup/ui/screens/home_page.dart';





 class JokePopUp extends StatelessWidget {
  const JokePopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(20),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  splashRadius: 10.0,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
 
