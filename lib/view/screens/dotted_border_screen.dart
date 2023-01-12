import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class DottedBorderScreen extends StatelessWidget {
  DottedBorderScreen({Key? key}) : super(key: key);

  Path customPath = Path()
    ..moveTo(60, 20)
    ..lineTo(20, 100)
    ..lineTo(60, 200)
    ..lineTo(100, 100)
    ..lineTo(60, 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dotted Border'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              DottedBorder(
                borderType: BorderType.RRect,
                strokeCap: StrokeCap.butt,
                dashPattern: const [10, 5],
                radius: const Radius.circular(12),
                padding: const EdgeInsets.all(6),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Container(
                    height: 100,
                    width: 300,
                    color: Colors.amber,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              DottedBorder(
                dashPattern: const [6, 3, 2, 3],
                padding: const EdgeInsets.all(6),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Container(
                    height: 100,
                    width: 300,
                    color: Colors.amber,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              DottedBorder(
                customPath: (size) => customPath, // PathBuilder
                color: Colors.indigo,
                dashPattern: const [8, 4],
                strokeWidth: 2,
                child: Container(
                  height: 220,
                  width: 120,
                  color: Colors.green.withAlpha(20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
