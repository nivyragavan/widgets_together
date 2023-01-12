import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class DottedLinesScreen extends StatelessWidget {
  const DottedLinesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dotted Line'),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            const Text("Default"),
            const SizedBox(height: 20),
            const DottedLine(),
            const SizedBox(height: 20),
            const Text("Dash length changed"),
            const SizedBox(height: 20),
            const DottedLine(dashLength: 40),
            const SizedBox(height: 20),
            const Text("Dash gap length changed"),
            const SizedBox(height: 20),
            const DottedLine(dashLength: 30, dashGapLength: 30),
            const SizedBox(height: 20),
            const Text("Line thickness changed"),
            const SizedBox(height: 20),
            const DottedLine(
              dashLength: 30,
              dashGapLength: 30,
              lineThickness: 30,
            ),
            const SizedBox(height: 20),
            const Text("Dash radius changed"),
            const SizedBox(height: 20),
            const DottedLine(
              dashLength: 30,
              dashGapLength: 30,
              lineThickness: 30,
              dashRadius: 16,
            ),
            const SizedBox(height: 20),
            const Text("Dash and dash gap color changed"),
            const SizedBox(height: 20),
            const DottedLine(
              dashLength: 30,
              dashGapLength: 30,
              lineThickness: 30,
              dashColor: Colors.blue,
              dashGapColor: Colors.red,
            ),
            const SizedBox(height: 20),
            const Text("Line direction and line length changed"),
            const SizedBox(height: 20),
            const DottedLine(
              dashLength: 30,
              dashGapLength: 30,
              lineThickness: 30,
              dashColor: Colors.blue,
              dashGapColor: Colors.red,
              direction: Axis.vertical,
              lineLength: 200,
            ),
            const SizedBox(height: 20),
            const Text("Dash gradient changed"),
            const SizedBox(height: 20),
            DottedLine(
              dashGradient: const [
                Colors.red,
                Colors.blue,
              ],
              dashLength: 10,
              lineThickness: 30,
            ),
            const SizedBox(height: 20),
            const Text("Dash gradient and dash gap gradient changed"),
            const SizedBox(height: 20),
            DottedLine(
              dashGradient: [
                Colors.red,
                Colors.red.withAlpha(0),
              ],
              dashGapGradient: [
                Colors.blue,
                Colors.blue.withAlpha(0),
              ],
              dashLength: 10,
              dashGapLength: 10,
              lineThickness: 30,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
