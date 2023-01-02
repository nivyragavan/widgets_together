import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:new_widgets/constant/style.dart';

class MapWithCustomMarkerScreen extends StatefulWidget {
  const MapWithCustomMarkerScreen({Key? key}) : super(key: key);

  @override
  State<MapWithCustomMarkerScreen> createState() =>
      _MapWithCustomMarkerScreenState();
}

class _MapWithCustomMarkerScreenState extends State<MapWithCustomMarkerScreen> {
  GoogleMapController? googleMapController;
  Map<String, Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map With Custom Marker'),
        centerTitle: true,
        backgroundColor: Colors.purple.shade500,
      ),
      body: GoogleMap(
        initialCameraPosition:
            const CameraPosition(target: currentLocation, zoom: 14),
        onMapCreated: (controller) {
          googleMapController = controller;
          addMarker('id', currentLocation);
        },
        markers: markers.values.toSet(),
      ),
    );
  }

  addMarker(String id, LatLng location) async {
    var markerIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'assets/car.png');

    var marker = Marker(
        markerId: MarkerId(id),
        position: location,
        infoWindow: const InfoWindow(
            title: "Saibaba Colony", snippet: "Viswa Technology Solutions"),
        icon: markerIcon);
    markers[id] = marker;
    setState(() {});
  }
}
