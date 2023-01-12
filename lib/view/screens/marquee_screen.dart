import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';

class MarqueeScreen extends StatelessWidget {
  const MarqueeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marquee'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Container(
          width: Get.width,
          height: Get.height / 2,
          color: Colors.teal,
          child: Marquee(
            text: 'This is an example of marquee widget',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            scrollAxis: Axis.horizontal,
            blankSpace: 20,
            velocity: 100,
            // pauseAfterRound: const Duration(seconds: 1),
            showFadingOnlyWhenScrolling: true,
            fadingEdgeStartFraction: 0.1,
            fadingEdgeEndFraction: 0.1,
            // numberOfRounds: 3,
            startPadding: 10,
            accelerationDuration: const Duration(seconds: 1),
            accelerationCurve: Curves.linear,
            decelerationDuration: const Duration(milliseconds: 500),
            decelerationCurve: Curves.easeOut,
          ),
        ),
      ),
    );
  }
}
