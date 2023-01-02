import 'package:flutter/material.dart';
import 'package:new_widgets/view/screens/navigation_screens/add_nav_screen.dart';
import 'package:new_widgets/view/screens/navigation_screens/cart_nav_screen.dart';
import 'package:new_widgets/view/screens/navigation_screens/home_nav_screen.dart';
import 'package:new_widgets/view/screens/navigation_screens/send_nav_screen.dart';
import 'package:new_widgets/view/screens/navigation_screens/user_nav_screen.dart';

class NavigationRailScreen extends StatefulWidget {
  const NavigationRailScreen({Key? key}) : super(key: key);

  @override
  State<NavigationRailScreen> createState() => _NavigationRailScreenState();
}

class _NavigationRailScreenState extends State<NavigationRailScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), body: buildNavigationRail());
  }

  buildAppBar() {
    return AppBar(
      title: const Text('Navigation Rail'),
      centerTitle: true,
      backgroundColor: Colors.orange.shade900,
    );
  }

  buildNavigationRail() {
    return Row(
      children: [
        NavigationRail(
            selectedIconTheme: IconThemeData(color: Colors.orange.shade900),
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                  icon: Icon(Icons.home_outlined), label: Text('Home')),
              NavigationRailDestination(
                  icon: Icon(Icons.supervised_user_circle_outlined),
                  label: Text('User')),
              NavigationRailDestination(
                  icon: Icon(Icons.person_add_alt_1_outlined),
                  label: Text('Add')),
              NavigationRailDestination(
                  icon: Icon(Icons.send_time_extension_outlined),
                  label: Text('Send')),
              NavigationRailDestination(
                  icon: Icon(Icons.local_grocery_store_outlined),
                  label: Text('Cart')),
            ],
            selectedIndex: _selectedIndex,
            labelType: NavigationRailLabelType.selected,
            selectedLabelTextStyle:
                TextStyle(fontSize: 15, color: Colors.orange.shade900),
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            }),
        const VerticalDivider(thickness: 1, width: 1),
        Expanded(child: mainScreens())
      ],
    );
  }

  Widget mainScreens() {
    switch (_selectedIndex) {
      case 0:
        return const HomeNavScreen();
      case 1:
        return const UserNavScreen();
      case 2:
        return const AddNavScreen();
      case 3:
        return const SendNavScreen();
      case 4:
        return const CartNavScreen();
      default:
        return const HomeNavScreen();
    }
  }
}
