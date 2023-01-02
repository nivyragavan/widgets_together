import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_widgets/constant/style.dart';
import 'package:new_widgets/model/place_auto_complate_response.dart';
import 'package:new_widgets/service/api_service.dart';

import '../../model/autocomplate_prediction.dart';
import '../../widget/location_list_tile.dart';

class LocationAutocompleteScreen extends StatefulWidget {
  const LocationAutocompleteScreen({Key? key}) : super(key: key);

  @override
  State<LocationAutocompleteScreen> createState() =>
      _LocationAutocompleteScreenState();
}

class _LocationAutocompleteScreenState
    extends State<LocationAutocompleteScreen> {
  List<AutocompletePrediction> placePredictions = [];

  TextEditingController place = TextEditingController();

  void placeAutocomplete(String query) async {
    Uri uri = Uri.https(
        "maps.googleapis.com",
        "maps/api/place/autocomplete/json",
        {"input": query, "key": placeApiKey});
    String? response = await ApiService.fetchUrl(uri);
    if (response != null) {
      PlaceAutocompleteResponse result =
          PlaceAutocompleteResponse.parseAutocompleteResult(response);
      if (result.predictions != null) {
        setState(() {
          placePredictions = result.predictions!;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Autocomplete'),
        centerTitle: true,
        backgroundColor: Colors.pink.shade500,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: place,
              cursorColor: Colors.pink.shade500,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.pink.shade500, width: 2)),
                  hintText: "Search your location",
                  prefixIcon: const Icon(Icons.share_location)),
              onChanged: (value) {
                placeAutocomplete(value);
              },
            ),
            const SizedBox(height: 15),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(height: 15),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade500,
                    fixedSize: Size(Get.width, 45)),
                onPressed: () {
                  // placeAutocomplete('Coimbatore');
                },
                icon: const Icon(Icons.my_location),
                label: const Text(
                  'Get my current location',
                  style: TextStyle(fontSize: 17),
                )),
            const SizedBox(height: 15),
            const Divider(
              thickness: 2,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: placePredictions.length,
                  itemBuilder: (context, index) {
                    return LocationListTile(
                        location: placePredictions[index].description!,
                        press: () {});
                  }),
            )
          ],
        ),
      ),
    );
  }
}
