import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();

  CameraPosition? _kGoogle;

  Set<Polygon> _polygon = HashSet<Polygon>();

  List<LatLng> points = [];
  /*  List<LatLng> points = [
    LatLng(33.891234, 9.799253),
    LatLng(33.891320, 9.799721),
    LatLng(33.892181, 9.799487),
    LatLng(33.892076, 9.799027),
  ]; */

  List<TextEditingController> controllers = [];

  int numberOfPoints = 4;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < numberOfPoints; i++) {
      controllers.add(TextEditingController());
    }

    _kGoogle = const CameraPosition(
      target: LatLng(33.891234, 9.799253),
      zoom: 14,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Draw Your Company Area"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 200, // Set a fixed height for the text fields container
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (int i = 0; i < numberOfPoints; i += 2)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          height: 0,
                          width: 5,
                        ),
                        Container(
                          width: 180,
                          height: 80,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.amber),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: controllers[i],
                              decoration: InputDecoration(
                                labelText: 'Latitude and Longitude ${i + 1}',
                                hintText:
                                    'Enter in format "33.892181, 9.799487"',
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {
                                if (i == 0) {
                                  updateCameraPosition(value);
                                }
                              },
                            ),
                          ),
                        ),
                        //  const SizedBox(height: 0),
                        if (i + 1 < numberOfPoints)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 180,
                              height: 80, // Adjust the height as needed
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.amber),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  controller: controllers[i + 1],
                                  decoration: InputDecoration(
                                    labelText:
                                        'Latitude and Longitude ${i + 2}',
                                    hintText:
                                        'Enter in format "33.892181, 9.799487"',
                                    border: InputBorder.none,
                                  ),
                                  onChanged: (value) {
                                    if (i == 0) {
                                      updateCameraPosition(value);
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                ],
              ),
            ),
          ),
          //SizedBox(height: 60),
          Flexible(
            flex: 8,
            child: Container(
              height: 400,
              child: SafeArea(
                child: GoogleMap(
                  initialCameraPosition: _kGoogle!,
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  compassEnabled: true,
                  polygons: _polygon,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              ),
            ),
          ),

          ElevatedButton(
            onPressed: () {
              updatePolygon();
            },
            child: const Text('Draw the Polygon'),
          ),
        ],
      ),
    );
  }

  void updateCameraPosition(String latLngString) {
    List<String> latLng = latLngString.split(',');
    if (latLng.length == 2) {
      double lat = double.tryParse(latLng[0].trim()) ?? 33.891234;
      double lng = double.tryParse(latLng[1].trim()) ?? 9.799253;
      setState(() {
        _kGoogle = CameraPosition(
          target: LatLng(lat, lng),
          zoom: 14,
        );
      });
    }
  }

  void updatePolygon() {
    List<LatLng> newPoints = [];
    for (int i = 0; i < numberOfPoints; i++) {
      String latLngString = controllers[i].text.trim();
      List<String> latLng = latLngString.split(',');
      if (latLng.length == 2) {
        double lat = double.tryParse(latLng[0].trim()) ?? 0.0;
        double lng = double.tryParse(latLng[1].trim()) ?? 0.0;
        newPoints.add(LatLng(lat, lng));
      }
    }

    setState(() {
      points = newPoints;
      _polygon.clear();
      _polygon.add(Polygon(
        polygonId: const PolygonId('1'),
        points: points,
        fillColor: Colors.blue.withOpacity(0.5),
        strokeColor: Colors.blue,
        strokeWidth: 2,
        geodesic: true,
      ));
    });
  }
}
