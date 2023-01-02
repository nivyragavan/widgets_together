import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:new_widgets/constant/style.dart';

class GoogleMapPolylineScreen extends StatefulWidget {
  const GoogleMapPolylineScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapPolylineScreen> createState() =>
      _GoogleMapPolylineScreenState();
}

class _GoogleMapPolylineScreenState extends State<GoogleMapPolylineScreen> {
  GoogleMapController? googleMapController;
  PolylinePoints polylinePoints = PolylinePoints();

  String googleApiKey = "AIzaSyDa3ndOn9kcJhiJqKBwi6D9WLwO_mH-_tM";

  Set<Marker> marker = Set();
  Map<PolylineId, Polyline> polylines = {};

  LatLng startLocation = const LatLng(11.0238, 76.9452);
  LatLng endLocation = const LatLng(11.0238, 76.9452);
  String fromLocation = "Search from location";
  String toLocation = "Search to location";
  PointLatLng fromPoint = const PointLatLng(0, 0);
  PointLatLng toPoint = const PointLatLng(0, 0);

  double distance = 0.0;

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  addPolyline(List<LatLng> polylineCoordinates) {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.pinkAccent.shade100,
        points: polylineCoordinates,
        width: 8);
    polylines[id] = polyline;
    setState(() {});
  }

  getDirections() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleApiKey,
        PointLatLng(startLocation.latitude, startLocation.longitude),
        PointLatLng(endLocation.latitude, endLocation.longitude));

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }

    double totalDistance = 0;
    for (var i = 0; i < polylineCoordinates.length - 1; i++) {
      totalDistance += calculateDistance(
          polylineCoordinates[i].latitude,
          polylineCoordinates[i].longitude,
          polylineCoordinates[i + 1].latitude,
          polylineCoordinates[i + 1].longitude);
    }
    print(totalDistance);
    setState(() {
      distance = totalDistance;
    });

    addPolyline(polylineCoordinates);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Map Polyline'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent.shade100,
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          GoogleMap(
            initialCameraPosition:
                CameraPosition(target: startLocation, zoom: 14),
            zoomGesturesEnabled: true,
            markers: marker,
            polylines: Set<Polyline>.of(polylines.values),
            mapType: MapType.normal,
            onMapCreated: (controller) {
              googleMapController = controller;
            },
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Container(
                  height: 64,
                  margin: const EdgeInsets.only(right: 16, left: 16),
                  child: Material(
                    child: InkWell(
                      onTap: () async {
                        double lat = 0;
                        double long = 0;
                        final place = await PlacesAutocomplete.show(
                            context: context,
                            apiKey: googleApiKey,
                            mode: Mode.overlay,
                            types: [],
                            strictbounds: false,
                            components: []);
                        if (place != null) {
                          setState(() {
                            fromLocation = place.description.toString();
                          });

                          final placeList = GoogleMapsPlaces(
                            apiKey: googleApiKey,
                            apiHeaders:
                                await const GoogleApiHeaders().getHeaders(),
                          );
                          final String placeid = place.placeId ?? "0";
                          final detail =
                              await placeList.getDetailsByPlaceId(placeid);
                          final geometry = detail.result.geometry;
                          if (geometry != null) {
                            lat = geometry.location.lat;
                            long = geometry.location.lng;
                          }

                          fromPoint = PointLatLng(lat, long);
                          setState(() {
                            startLocation = LatLng(lat, long);
                            marker.add(Marker(
                                markerId: MarkerId(startLocation.toString()),
                                position: startLocation,
                                infoWindow:
                                    InfoWindow(title: place.description),
                                icon: BitmapDescriptor.defaultMarker));
                          });
                          getDirections();
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: ListTile(
                            title: Text(
                              fromLocation,
                              style: const TextStyle(fontSize: 18),
                            ),
                            trailing: const Icon(Icons.search),
                            dense: true),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 64,
                  margin: const EdgeInsets.only(right: 16, left: 16, top: 15),
                  child: Material(
                    child: InkWell(
                      onTap: () async {
                        double lat = 0;
                        double long = 0;
                        final place = await PlacesAutocomplete.show(
                            context: context,
                            apiKey: googleApiKey,
                            mode: Mode.overlay,
                            types: [],
                            strictbounds: false,
                            components: []);
                        if (place != null) {
                          setState(() {
                            toLocation = place.description.toString();
                          });

                          final placeList = GoogleMapsPlaces(
                            apiKey: googleApiKey,
                            apiHeaders:
                                await const GoogleApiHeaders().getHeaders(),
                          );
                          final String placeid = place.placeId ?? "0";
                          final detail =
                              await placeList.getDetailsByPlaceId(placeid);
                          final geometry = detail.result.geometry;
                          if (geometry != null) {
                            lat = geometry.location.lat;
                            long = geometry.location.lng;
                          }

                          toPoint = PointLatLng(lat, long);
                          setState(() {
                            endLocation = LatLng(lat, long);
                            marker.add(Marker(
                                markerId: MarkerId(endLocation.toString()),
                                position: endLocation,
                                infoWindow:
                                    InfoWindow(title: place.description),
                                icon: BitmapDescriptor.defaultMarker));
                          });
                          getDirections();
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: ListTile(
                            title: Text(
                              toLocation,
                              style: const TextStyle(fontSize: 18),
                            ),
                            trailing: const Icon(Icons.search),
                            dense: true),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Total Distance: ${distance.toStringAsFixed(2)} KM",
                  style: TextStyle(
                      color: Colors.pinkAccent.shade100,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
