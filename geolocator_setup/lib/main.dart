import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:iconsax/iconsax.dart';

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

  Future<Position> getposition() async {
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

  // get the user adress using latitude and longitude
  Future<void> getuseradress(Position position) async {
    List<Placemark> fulladress =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = fulladress[0];
    Address =
        '${place.street} ${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                padding: const EdgeInsets.only(
                    left: 40, top: 0, right: 40, bottom: 0),
                child: Text('${Address}'),
              ),
              const Spacer(),
              ElevatedButton(
                  onPressed: () async {
                    Position position = await getposition();
                    location =
                        'latitude: ${position.latitude} , longitude: ${position.longitude}';
                    getuseradress(position);

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide.none,
                          ),
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          child: PopUp(
                            getuseradress: getuseradress,
                            address: Address,
                          ),
                        );
                      },
                    );

/*                     showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Stack(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Your Address:"),
                                    SizedBox(width: 50),
                                    IconButton(
                                      alignment: Alignment.topRight,
                                      icon: Icon(Icons.close),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            content: Stack(children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Time: $formattedTime"),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text("Location: ${Address}"),
                                ],
                              ),
                            ]),
                            actions: [
                              TextButton(
                                child: Text("confirm"),
                                onPressed: () {
                                  // do some actions and back to home page
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                          ;
                        }); */
                  },
                  child: Text('Get Location')),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
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

class PopUp extends StatelessWidget {
  final Future<void> Function(Position) getuseradress;
  String address = '';
  PopUp({Key? key, required this.getuseradress, required this.address})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();
    String formattedTime = DateFormat('HH:mm').format(currentTime);
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(20),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: const [
            // BoxShadow(color: kcParagraphColor, blurRadius: 1.0)
          ],
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Iconsax.close_circle),
                splashRadius: 10.0,
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "Confirm your info",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  "Time : $formattedTime",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Text(
                        "Your Adress:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text("$address"),
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Confirm'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
