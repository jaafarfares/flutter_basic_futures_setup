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

  static final CameraPosition _kGoogle = const CameraPosition(
    target: LatLng(33.891234, 9.799253),
    zoom: 14,
  );

  Set<Polygon> _polygon = HashSet<Polygon>();

  List<LatLng> points = [
    LatLng(33.891234, 9.799253),
    LatLng(33.891320, 9.799721),
    LatLng(33.892181, 9.799487),
    LatLng(33.892076, 9.799027),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //initialize polygon
    _polygon.add(Polygon(
      // given polygonId
      polygonId: PolygonId('1'),
      // initialize the list of points to display polygon
      points: points,
      // given color to polygon
      fillColor: Colors.blue.withOpacity(0.5),
      // given border color to polygon
      strokeColor: Colors.blue,
      // set stroke width
      strokeWidth: 2,
      geodesic: true,
      // given width of border
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        // title of app
        title: Text("Polygon Area"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: SafeArea(
            child: GoogleMap(
              //given camera position
              initialCameraPosition: _kGoogle,
              // on below line we have given map type
              mapType: MapType.normal,
              // on below line we have enabled location
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              // on below line we have enabled compass location
              compassEnabled: true,
              // on below line we have added polygon
              polygons: _polygon,
              // displayed google map
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
        ),
      ),
    );
  }
}
