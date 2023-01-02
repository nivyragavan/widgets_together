import 'package:flutter/material.dart';

class StepperScreen extends StatefulWidget {
  const StepperScreen({Key? key}) : super(key: key);

  @override
  State<StepperScreen> createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildStepper(),
    );
  }

  buildAppBar() {
    return AppBar(
      title: const Text('Stepper'),
      centerTitle: true,
      backgroundColor: Colors.blue.shade900,
    );
  }

  buildStepper() {
    return Stepper(
      steps: [
        Step(
            title: Text(
              'Step 1',
              style: TextStyle(color: Colors.blue.shade900, fontSize: 17),
            ),
            content: const Text('Login to the app',
                style: TextStyle(color: Colors.pink, fontSize: 17))),
        Step(
            title: Text(
              'Step 2',
              style: TextStyle(color: Colors.blue.shade900, fontSize: 17),
            ),
            content: const Text('Enter otp',
                style: TextStyle(color: Colors.pink, fontSize: 17))),
        Step(
            title: Text(
              'Step 3',
              style: TextStyle(color: Colors.blue.shade900, fontSize: 17),
            ),
            content: const Text('Choose pickup and drop location',
                style: TextStyle(color: Colors.pink, fontSize: 17))),
        Step(
            title: Text(
              'Step 4',
              style: TextStyle(color: Colors.blue.shade900, fontSize: 17),
            ),
            content: const Text('Choose payment method',
                style: TextStyle(color: Colors.pink, fontSize: 17))),
        Step(
            title: Text(
              'Step 5',
              style: TextStyle(color: Colors.blue.shade900, fontSize: 17),
            ),
            content: const Text('Confirm booking',
                style: TextStyle(color: Colors.pink, fontSize: 17))),
      ],
      onStepTapped: (int index) {
        setState(() {
          _currentStep = index;
        });
      },
      currentStep: _currentStep,
      onStepContinue: () {
        if (_currentStep != 4) {
          setState(() {
            _currentStep += 1;
          });
        }
      },
      onStepCancel: () {
        if (_currentStep != 0) {
          setState(() {
            _currentStep -= 1;
          });
        }
      },
    );
  }
}
