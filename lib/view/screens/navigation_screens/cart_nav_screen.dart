import 'package:flutter/material.dart';

class CartNavScreen extends StatelessWidget {
  const CartNavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Cart Screen',
          style: TextStyle(
              fontSize: 30, letterSpacing: 3, color: Colors.orange.shade900),
        ),
      ),
    );
  }
}
