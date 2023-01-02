import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GeoLocatorScreen extends StatefulWidget {
  const GeoLocatorScreen({Key? key}) : super(key: key);

  @override
  State<GeoLocatorScreen> createState() => _GeoLocatorScreenState();
}

class _GeoLocatorScreenState extends State<GeoLocatorScreen> {
  String currentAddress = 'Current Location';
  Position? currentPosition;

  Future<Position?> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location service disabled.');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission == await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permission');
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark placemark = placemarks[0];
      setState(() {
        currentPosition = position;
        currentAddress =
            "${placemark.street}, ${placemark.subLocality}, ${placemark.locality}, ${placemark.postalCode},${placemark.administrativeArea}, ${placemark.country}";
      });
    } catch (e) {
      print(e);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geo Locator'),
        centerTitle: true,
        backgroundColor: Colors.red.shade300,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentAddress,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, height: 2),
            ),
            const SizedBox(height: 20),
            currentPosition != null
                ? Text('Latitude = ${currentPosition!.latitude}',
                    style: const TextStyle(fontSize: 20))
                : Container(),
            const SizedBox(height: 20),
            currentPosition != null
                ? Text('Longitude = ${currentPosition!.longitude}',
                    style: const TextStyle(fontSize: 20))
                : Container(),
            const SizedBox(height: 50),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade300,
                    fixedSize: const Size(250, 45)),
                onPressed: () {
                  getCurrentLocation();
                },
                child: const Text('Get Current Location',
                    style: TextStyle(fontSize: 17)))
          ],
        ),
      ),
    );
  }
}
