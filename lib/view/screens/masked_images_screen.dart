import 'package:flutter/material.dart';
import 'package:new_widgets/widget/masked_image.dart';

class MaskedImageScreen extends StatelessWidget {
  const MaskedImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Masked Image'),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
      ),
      body:const Center(
        child:  MaskedImage(
            image: NetworkImage(
                'https://mypersiancat.com/wp-content/uploads/2021/05/Ginger-Persian-cat-1.jpg'),
            child: Text(
              'DOLI',
              style: TextStyle(fontSize: 150, fontWeight: FontWeight.bold,color: Colors.black),
            )),
      ),
    );
  }
}
