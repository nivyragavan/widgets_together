import 'package:flutter/material.dart';

class SendNavScreen extends StatelessWidget {
  const SendNavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Send Screen',
          style: TextStyle(
              fontSize: 30, letterSpacing: 3, color: Colors.orange.shade900),
        ),
      ),
    );
  }
}
