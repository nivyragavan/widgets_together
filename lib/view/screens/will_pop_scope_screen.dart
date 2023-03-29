import 'package:flutter/material.dart';
import 'package:get/get.dart';


class WillPopScopeScreen extends StatelessWidget {
  const WillPopScopeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          final shouldPop = await showMyDialog(context);
          return shouldPop ?? false;
        },
        child: Scaffold(
          appBar: AppBar(
            title:const Text('Will Pop Scope'),
            centerTitle: true,
            backgroundColor: Colors.brown.shade200,
          ),
          body: SizedBox(
            width: Get.width,
            height: Get.height,
            child: Image.network('https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Ym9va3xlbnwwfHwwfHw%3D&w=1000&q=80',
            fit: BoxFit.cover,
            ),
          ),
        ));
  }

  Future<bool?> showMyDialog(BuildContext context) => showDialog<bool>(context: context, builder:(context){
    return AlertDialog(
      title: const Text('Are you sure to quit ?'),
      actions: [
        TextButton(onPressed: (){Navigator.pop(context,true);}, child: const Text('Yes')),
        TextButton(onPressed: (){Navigator.pop(context,false);}, child: const Text('No')),
      ],
    );
  });
}