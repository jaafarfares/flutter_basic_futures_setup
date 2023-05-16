import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future getposition() async {
    bool services;
    LocationPermission permession;

    services = await Geolocator.isLocationServiceEnabled();
    if (services == false) {
      AwesomeDialog(
          context: context,
          title: "services",
          body: Text("sevices not enabledd"))
        ..show();
    }
    permession = await Geolocator.checkPermission();

    if (permession == LocationPermission.denied) {
      permession = await Geolocator.requestPermission();
      if (permession == LocationPermission.whileInUse) {
        getlongatti();
      }
    }

    print(permession);
  }

  Future<Position> getlongatti() async {
    return await Geolocator.getCurrentPosition().then((value) => value);
  }

  @override
  void initState() {
    getposition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var correntlocation;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Center(
              child: ElevatedButton(
        child: Text("location"),
        onPressed: () async {
          correntlocation = await getlongatti();
          print("==========================");
          // display Latitude and Longitude in the console
          print(correntlocation);
          print("==========================");
        },
      ))),
    );
  }
}
