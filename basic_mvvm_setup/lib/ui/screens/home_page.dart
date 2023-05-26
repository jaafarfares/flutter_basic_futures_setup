import 'dart:convert';

import 'package:basic_mvvm_setup/ui/screens/jokes_list.dart';
import 'package:basic_mvvm_setup/view_models/home_page_viewmodel.dart';
import 'package:basic_mvvm_setup/view_models/joke_viewmodel.dart';
import 'package:basic_mvvm_setup/ui/screens/joke_popup.dart';
import 'package:flutter/material.dart';

import '../../models/joke_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // create my viewmodel instance
  var homemodel = HomePageViewModel();
  var joke = JokeViewModel();
  var jokeee = JokeModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(homemodel.pagetitle),
          centerTitle: true,
        ),
        body: Center(
          child: Column(children: [
            Spacer(),
            ElevatedButton(
              child: Text(homemodel.first),
              onPressed: () {
                joke.fetchjoke();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const JokePopUp()),
                );
              },
            ),
            Spacer(),
            ElevatedButton(
              child: Text(homemodel.second),
              onPressed: () {
                joke.fetchjokes();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const JokesList()),
                );
              },
            ),
            Spacer(),
          ]),
        ));
  }
}
