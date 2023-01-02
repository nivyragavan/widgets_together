import 'package:flutter/material.dart';

class InteractiveViewerScreen extends StatelessWidget {
  const InteractiveViewerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildInteractiveViewer(),
    );
  }

  buildAppBar() {
    return AppBar(
      title: const Text('Interactive Viewer'),
      centerTitle: true,
      backgroundColor: Colors.green.shade900,
    );
  }

  buildInteractiveViewer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Zoom In and Zoom Out',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
              color: Colors.green.shade900),
        ),
        const SizedBox(height: 50),
        InteractiveViewer(child: Image.asset('assets/boat.jpg')),
      ],
    );
  }
}
