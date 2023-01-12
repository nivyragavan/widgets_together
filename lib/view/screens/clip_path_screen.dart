import 'package:flutter/material.dart';

class ClipPathScreen extends StatelessWidget {
  const ClipPathScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clip Path'),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: ClipPath(
        child: Container(
          width: double.infinity,
          height: 300,
          color: Colors.pinkAccent,
        ),
      ),
    );
  }
}
