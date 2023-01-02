import 'package:flutter/material.dart';

class UserNavScreen extends StatelessWidget {
  const UserNavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'User Screen',
          style: TextStyle(
              fontSize: 30, letterSpacing: 3, color: Colors.orange.shade900),
        ),
      ),
    );
  }
}
