import 'package:flutter/material.dart';

class HomeNavScreen extends StatelessWidget {
  const HomeNavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Home Screen',
          style: TextStyle(
              fontSize: 30, letterSpacing: 3, color: Colors.orange.shade900),
        ),
      ),
    );
  }
}
