import 'package:flutter/material.dart';

class AddNavScreen extends StatelessWidget {
  const AddNavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Add Screen',
          style: TextStyle(
              fontSize: 30, letterSpacing: 3, color: Colors.orange.shade900),
        ),
      ),
    );
  }
}
