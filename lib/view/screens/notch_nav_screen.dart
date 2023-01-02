import 'package:flutter/material.dart';
import 'package:new_widgets/view/screens/navigation_screens/cart_nav_screen.dart';
import 'package:new_widgets/view/screens/navigation_screens/send_nav_screen.dart';
import 'package:new_widgets/view/screens/navigation_screens/user_nav_screen.dart';

import 'navigation_screens/home_nav_screen.dart';

class NotchNavScreen extends StatefulWidget {
  const NotchNavScreen({Key? key}) : super(key: key);

  @override
  State<NotchNavScreen> createState() => _NotchNavScreenState();
}

class _NotchNavScreenState extends State<NotchNavScreen> {
  int currentTab = 0;
  final List<Widget> screens = [
    HomeNavScreen(),
    SendNavScreen(),
    UserNavScreen(),
    CartNavScreen(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeNavScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Notched Nav Bar'),
            centerTitle: true,
            backgroundColor: Colors.amberAccent.shade700),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          notchMargin: 10,
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = HomeNavScreen();
                          currentTab = 0;
                        });
                      },
                      minWidth: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home,
                            color:
                                currentTab == 0 ? Colors.yellow : Colors.white,
                          ),
                          Text(
                            'Home',
                            style: TextStyle(
                                color: currentTab == 0
                                    ? Colors.yellow
                                    : Colors.white),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = SendNavScreen();
                          currentTab = 1;
                        });
                      },
                      minWidth: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.send,
                            color:
                                currentTab == 1 ? Colors.yellow : Colors.white,
                          ),
                          Text(
                            'Send',
                            style: TextStyle(
                                color: currentTab == 1
                                    ? Colors.yellow
                                    : Colors.white),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = UserNavScreen();
                          currentTab = 2;
                        });
                      },
                      minWidth: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            color:
                                currentTab == 2 ? Colors.yellow : Colors.white,
                          ),
                          Text(
                            'User',
                            style: TextStyle(
                                color: currentTab == 2
                                    ? Colors.yellow
                                    : Colors.white),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = CartNavScreen();
                          currentTab = 3;
                        });
                      },
                      minWidth: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_shopping_cart_outlined,
                            color:
                                currentTab == 3 ? Colors.yellow : Colors.white,
                          ),
                          Text(
                            'Cart',
                            style: TextStyle(
                                color: currentTab == 3
                                    ? Colors.yellow
                                    : Colors.white),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        body: PageStorage(bucket: bucket, child: currentScreen));
  }
}
