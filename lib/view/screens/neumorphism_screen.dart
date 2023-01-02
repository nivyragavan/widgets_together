import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NeumorphismScreen extends StatelessWidget {
  const NeumorphismScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.systemGrey4,
      appBar: AppBar(
          title: const Text('Neumorphism'),
          centerTitle: true,
          backgroundColor: Colors.red.shade700),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: CupertinoColors.systemGrey4,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-28, -28),
                      blurRadius: 30,
                    ),
                    BoxShadow(
                        color: Color(0xffa7a9af),
                        offset: Offset(28, 28),
                        blurRadius: 30),
                  ]),
            ),
            const SizedBox(height: 50),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: CupertinoColors.systemGrey4,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-28, -28),
                      blurRadius: 30,
                      // inset: true
                    ),
                    BoxShadow(
                        color: Color(0xffa7a9af),
                        offset: Offset(28, 28),
                        blurRadius: 30),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
