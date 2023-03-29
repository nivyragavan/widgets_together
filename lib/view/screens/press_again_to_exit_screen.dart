import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';


class PressAgainToExitScreen extends StatefulWidget {
  const PressAgainToExitScreen({Key? key}) : super(key: key);

  @override
  State<PressAgainToExitScreen> createState() => _PressAgainToExitScreenState();
}

class _PressAgainToExitScreenState extends State<PressAgainToExitScreen> {

  DateTime timeBackPressed = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        final difference = DateTime.now().difference(timeBackPressed);
        final isExitWarning = difference >= const Duration(seconds: 2);
        timeBackPressed = DateTime.now();
        if(isExitWarning){
          const msg = 'Press back again to exit';
          Fluttertoast.showToast(msg: msg,fontSize: 18);
          return false;
        } else{
          Fluttertoast.cancel();
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Press Again To Exit'),
          centerTitle: true,
          backgroundColor: Colors.red.shade400,
        ),
        body: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Image.network('https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Ym9va3xlbnwwfHwwfHw%3D&w=1000&q=80',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
