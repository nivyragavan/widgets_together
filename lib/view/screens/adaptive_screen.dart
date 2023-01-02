import 'package:flutter/material.dart';

class AdaptiveScreen extends StatefulWidget {
  const AdaptiveScreen({Key? key}) : super(key: key);

  @override
  State<AdaptiveScreen> createState() => _AdaptiveScreenState();
}

class _AdaptiveScreenState extends State<AdaptiveScreen> {
  double currentValue = 0;
  bool switchOff = false;
  bool switchOn = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildSliderAdaptive(),
          buildSwitchListTileAdaptive(),
          buildSwitchAdaptive(),
          buildShareAdaptive(),
          buildCircularProgressIndicatorAdaptive()
        ],
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      title: const Text('Adaptive'),
      centerTitle: true,
      backgroundColor: Colors.pink.shade900,
    );
  }

  buildSliderAdaptive() {
    return Slider.adaptive(
      value: currentValue,
      onChanged: (double newValue) {
        setState(() {
          currentValue = newValue;
        });
      },
      thumbColor: Colors.pink.shade900,
      activeColor: Colors.pink.shade900,
      inactiveColor: Colors.pink.shade50,
    );
  }

  buildSwitchListTileAdaptive() {
    return SwitchListTile.adaptive(
        title: Text(
          'Switch List Tile Adaptive',
          style: TextStyle(color: Colors.pink.shade900),
        ),
        value: switchOff,
        activeColor: Colors.pink.shade900,
        tileColor: Colors.pink.shade50,
        onChanged: (bool newValue) {
          setState(() {
            switchOff = newValue;
          });
        });
  }

  buildSwitchAdaptive() {
    return Switch.adaptive(
        value: switchOn,
        activeColor: Colors.pink.shade900,
        onChanged: (bool newValue) {
          setState(() {
            switchOn = newValue;
          });
        });
  }

  buildShareAdaptive() {
    return Icon(
      Icons.adaptive.share,
      color: Colors.pink.shade900,
    );
  }

  buildCircularProgressIndicatorAdaptive() {
    return CircularProgressIndicator(
      color: Colors.pink.shade900,
    );
  }
}
