import 'package:flutter/material.dart';

class IntrinsicHeightScreen extends StatelessWidget {
  const IntrinsicHeightScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildIntrinsicHeight(),
    );
  }

  buildAppBar() {
    return AppBar(
      title: const Text('Intrinsic Height'),
      centerTitle: true,
      backgroundColor: Colors.yellow.shade900,
    );
  }

  buildIntrinsicHeight() {
    return IntrinsicHeight(
      child: Column(
        children: [
          Expanded(
            child: Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(flex: 2, child: Image.asset('assets/wonderla.jpg')),
                  const SizedBox(width: 5),
                  const Expanded(
                    flex: 3,
                    child: Text(
                      'We welcome you to a brand new experience of hospitality at Wonderla Resort, Bengaluru. Redefining the age-old concept of providing guests with a comfortable stay and food, Wonderla is leaps and bounds ahead. We are here to provide an experience that strays from the norm - to gift you memories to be cherished for a lifetime',
                      style: TextStyle(fontSize: 15),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
