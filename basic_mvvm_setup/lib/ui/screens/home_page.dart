import 'package:basic_mvvm_setup/models/home_page_viewmodel.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // create my viewmodel instance
  var homemodel = HomePageViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(homemodel.pagetitle),
          centerTitle: true,
        ),
        body: Center(
          child: ElevatedButton(
            child: Text(homemodel.pagebody),
            onPressed: () {},
          ),
        ));
  }
}
