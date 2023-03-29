import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ButtonState { init, loading, done }

class AnimatedLoadingSpinnerScreen extends StatefulWidget {
  const AnimatedLoadingSpinnerScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedLoadingSpinnerScreen> createState() =>
      _AnimatedLoadingSpinnerScreenState();
}

class _AnimatedLoadingSpinnerScreenState
    extends State<AnimatedLoadingSpinnerScreen> {
  ButtonState state = ButtonState.init;

  bool isLoading = false;

  bool isAnimating = true;

  @override
  Widget build(BuildContext context) {
    final isDone = state == ButtonState.done;
    final isStretched = isAnimating || state == ButtonState.init;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Loading Spinner'),
        centerTitle: true,
        backgroundColor: Colors.purple.shade600,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(300, 50),
                    shape: const StadiumBorder()),
                onPressed: () async {
                  if (isLoading) return;
                  setState(() {
                    isLoading = true;
                  });
                  await Future.delayed(const Duration(seconds: 5));
                  setState(() {
                    isLoading = false;
                  });
                },
                child: isLoading
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator(
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 24,
                          ),
                          Text(
                            'PLEASE WAIT',
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          )
                        ],
                      )
                    : const Text(
                        'LOGIN',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            letterSpacing: 2),
                      )),
            const SizedBox(
              height: 50,
            ),
            AnimatedContainer(
              width: state == ButtonState.init ? 300 : 70,
              height: 50,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
              onEnd: () => setState(() =>
                isAnimating = !isAnimating
              ),
              child: isStretched
                  ? OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: const StadiumBorder(),
                          side:
                              const BorderSide(width: 2, color: Colors.purple)),
                      onPressed: () async {
                        setState(() {
                          state = ButtonState.loading;
                        });
                        await Future.delayed(const Duration(seconds: 3));
                        setState(() {
                          state = ButtonState.done;
                        });
                        await Future.delayed(const Duration(seconds: 3));
                        setState(() {
                          state = ButtonState.init;
                        });
                      },
                      child: const Text(
                        'SUBMIT',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.purple,
                            letterSpacing: 2),
                      ))
                  : buildSmallButton(isDone),
            )
          ],
        ),
      ),
    );
  }

  buildSmallButton(bool isDone) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: isDone ? Colors.green : Colors.purple,
      child: Center(
        child: isDone
            ? const Icon(
                Icons.done,
                size: 40,
                color: Colors.white,
              )
            : const CircularProgressIndicator(
                color: Colors.white,
              ),
      ),
    );
  }
}
