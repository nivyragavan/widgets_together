import 'package:flutter/material.dart';

class ClipPathScreen extends StatelessWidget {
  const ClipPathScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clip Path'),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: ClipPath(
        clipper: CustomClipPath(),
        child: Container(
          width: double.infinity,
          height: 300,
          color: Colors.pinkAccent,
          child: const Center(child:Text('Flutter Shape Marker',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)),
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;


    Path path0 = Path();
    path0.moveTo(0,0);
    path0.lineTo(0,size.height);
    path0.quadraticBezierTo(size.width*0.3614667,size.height*0.4859857,size.width*0.5007917,size.height*0.7841857);
    path0.quadraticBezierTo(size.width*0.5688750,size.height*0.9939143,size.width,size.height);
    path0.lineTo(size.width,0);
    path0.lineTo(0,0);
    path0.close();

    return path0;

  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }

}