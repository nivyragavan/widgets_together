import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_widgets/view/screens/adaptive_screen.dart';
import 'package:new_widgets/view/screens/clip_path_screen.dart';
import 'package:new_widgets/view/screens/dark_theme_screen.dart';
import 'package:new_widgets/view/screens/dotted_border_screen.dart';
import 'package:new_widgets/view/screens/dotted_lines_screen.dart';
import 'package:new_widgets/view/screens/geo_locator_screen.dart';
import 'package:new_widgets/view/screens/google_map_polylines_screen.dart';
import 'package:new_widgets/view/screens/listview_navigation_screen.dart';
import 'package:new_widgets/view/screens/location_autocomplete_screen.dart';
import 'package:new_widgets/view/screens/map_with_custom_marker_screen.dart';
import 'package:new_widgets/view/screens/marquee_screen.dart';
import 'package:new_widgets/view/screens/navigation_rail_screen.dart';
import 'package:new_widgets/view/screens/interactive_viewer_screen.dart';
import 'package:new_widgets/view/screens/intrinsic_height_screen.dart';
import 'package:new_widgets/view/screens/neumorphism_screen.dart';
import 'package:new_widgets/view/screens/notch_nav_screen.dart';
import 'package:new_widgets/view/screens/number_pagination_screen.dart';
import 'package:new_widgets/view/screens/pagination_screen.dart';
import 'package:new_widgets/view/screens/reorderable_listview_screen.dart';
import 'package:new_widgets/view/screens/shader_mask_screen.dart';
import 'package:new_widgets/view/screens/stepper_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
          padding: const EdgeInsets.all(15),
          child: Wrap(
            spacing: 10,
            children: [
              buildChipItems(
                  label: 'Stepper',
                  color: Colors.blue.shade900,
                  onPressed: () {
                    Get.to(const StepperScreen());
                  }),
              buildChipItems(
                  label: 'Adaptive',
                  color: Colors.pink.shade900,
                  onPressed: () {
                    Get.to(const AdaptiveScreen());
                  }),
              buildChipItems(
                  label: 'Shader Mask',
                  color: Colors.red.shade900,
                  onPressed: () {
                    Get.to(const ShaderMaskScreen());
                  }),
              buildChipItems(
                  label: 'Interactive Viewer',
                  color: Colors.green.shade900,
                  onPressed: () {
                    Get.to(const InteractiveViewerScreen());
                  }),
              buildChipItems(
                  label: 'Intrinsic Height',
                  color: Colors.yellow.shade900,
                  onPressed: () {
                    Get.to(const IntrinsicHeightScreen());
                  }),
              buildChipItems(
                  label: 'Navigation Rail',
                  color: Colors.orange.shade900,
                  onPressed: () {
                    Get.to(const NavigationRailScreen());
                  }),
              buildChipItems(
                  label: 'Dark Theme',
                  color: Colors.purple.shade900,
                  onPressed: () {
                    Get.to(const DarkThemeScreen());
                  }),
              buildChipItems(
                  label: 'Notched Nav Bar',
                  color: Colors.amberAccent.shade700,
                  onPressed: () {
                    Get.to(const NotchNavScreen());
                  }),
              buildChipItems(
                  label: 'Neumorphism',
                  color: Colors.red.shade700,
                  onPressed: () {
                    Get.to(const NeumorphismScreen());
                  }),
              buildChipItems(
                  label: 'Scroll Pagination',
                  color: Colors.green.shade300,
                  onPressed: () {
                    Get.to(const PaginationScreen());
                  }),
              buildChipItems(
                  label: 'Number Pagination',
                  color: Colors.blue.shade300,
                  onPressed: () {
                    Get.to(const NumberPaginationScreen());
                  }),
              buildChipItems(
                  label: 'Geo Locator',
                  color: Colors.red.shade300,
                  onPressed: () {
                    Get.to(const GeoLocatorScreen());
                  }),
              buildChipItems(
                  label: 'Location Autocomplete',
                  color: Colors.pink.shade500,
                  onPressed: () {
                    Get.to(const LocationAutocompleteScreen());
                  }),
              buildChipItems(
                  label: 'Map With Custom Marker',
                  color: Colors.purple.shade500,
                  onPressed: () {
                    Get.to(const MapWithCustomMarkerScreen());
                  }),
              buildChipItems(
                  label: 'Google Map Polyline',
                  color: Colors.pinkAccent.shade100,
                  onPressed: () {
                    Get.to(const GoogleMapPolylineScreen());
                  }),
              buildChipItems(
                  label: 'Marquee',
                  color: Colors.teal,
                  onPressed: () {
                    Get.to(const MarqueeScreen());
                  }),
              buildChipItems(
                  label: 'Dotted Line',
                  color: Colors.lightGreen,
                  onPressed: () {
                    Get.to(const DottedLinesScreen());
                  }),
              buildChipItems(
                  label: 'Dotted Border',
                  color: Colors.indigo,
                  onPressed: () {
                    Get.to(DottedBorderScreen());
                  }),
              buildChipItems(
                  label: 'Reorderable Listview',
                  color: Colors.orange,
                  onPressed: () {
                    Get.to(const ReorderableListviewScreen());
                  }),
              buildChipItems(
                  label: 'Listview Navigation',
                  color: Colors.pink,
                  onPressed: () {
                    Get.to(ListviewNavigationScreen());
                  }),
              buildChipItems(
                  label: 'Clip Path',
                  color: Colors.deepPurpleAccent,
                  onPressed: () {
                    Get.to(const ClipPathScreen());
                  }),
            ],
          )),
    ));
  }
}

Widget buildChipItems(
    {required String label,
    required Color color,
    required VoidCallback onPressed}) {
  return ActionChip(
      label: Text(
        label,
        style: TextStyle(color: color, fontSize: 17),
      ),
      backgroundColor: Colors.transparent,
      shape: StadiumBorder(side: BorderSide(color: color, width: 2)),
      onPressed: onPressed);
}
