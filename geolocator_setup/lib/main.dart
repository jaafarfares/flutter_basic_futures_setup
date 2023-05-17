import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String location = 'Press the Button to get your location';
  String Address = '';

  // get the user latitude and longitude

  Future<Position> _getGeoLocationPosition() async {
    bool servicessaccess;
    LocationPermission permission;
    servicessaccess = await Geolocator.isLocationServiceEnabled();
    if (!servicessaccess) {
      await Geolocator.openLocationSettings();
      AwesomeDialog(
          context: context,
          title: "services",
          body: Text("sevices not enabledd"))
        ..show();
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        AwesomeDialog(
            context: context,
            title: "services",
            body: Text("Your Location permissions are denied "))
          ..show();
      }
    }
    if (permission == LocationPermission.deniedForever) {
      AwesomeDialog(
          context: context,
          title: "services",
          body: Text("Your Location permissions are permanently denied."))
        ..show();
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

/*   Future getposition() async {
    bool services;
    LocationPermission permession;

    services = await Geolocator.isLocationservicessaccess();
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
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((value) => value);
  } 

  @override
  void initState() {
    getposition();
    super.initState();
  }*/

  // get the user adress using latitude and longitude
  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> fulladress =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = fulladress[0];
    Address =
        '${place.street} ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var correntlocation;

    return Scaffold(
      appBar: AppBar(
        title: Text('Get User Location'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'latitude and longitude',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              location,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Your Full Address',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 40, top: 0, right: 40, bottom: 0),
              child: Text('${Address}'),
            ),
            const Spacer(),
            ElevatedButton(
                onPressed: () async {
                  Position position = await _getGeoLocationPosition();
                  location =
                      'latitude: ${position.latitude} , longitude: ${position.longitude}';
                  GetAddressFromLatLong(position);
                },
                child: Text('Get Location')),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
