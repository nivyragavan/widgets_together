import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShaderMaskScreen extends StatelessWidget {
  const ShaderMaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: Container(
            width: Get.width,
            height: Get.height,
            color: Colors.black,
            child: Center(
              child: buildShaderMask(),
            )));
  }

  buildAppBar() {
    return AppBar(
      title: const Text('Shader Mask'),
      centerTitle: true,
      backgroundColor: Colors.red.shade900,
    );
  }

  buildShaderMask() {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
              colors: [Colors.blue, Colors.purple, Colors.orange, Colors.red])
          .createShader(bounds),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('WONDERLA',
              style: TextStyle(
                  fontSize: 30, color: Colors.white, letterSpacing: 3)),
          Container(
              width: 150,
              height: 200,
              child: Image.asset(
                'assets/wonderla.jpg',
                fit: BoxFit.fill,
              )),
          const Text(
              'We welcome you to a brand new experience of hospitality at Wonderla Resort, Bengaluru. Redefining the age-old concept of providing guests with a comfortable stay and food, Wonderla is leaps and bounds ahead. We are here to provide an experience that strays from the norm - to gift you memories to be cherished for a lifetime',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20, color: Colors.white, letterSpacing: 3)),
        ],
      ),
    );
  }
}
