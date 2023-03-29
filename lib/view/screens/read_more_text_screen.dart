import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';


class ReadMoreTextScreen extends StatefulWidget {
  const ReadMoreTextScreen({Key? key}) : super(key: key);

  @override
  State<ReadMoreTextScreen> createState() => _ReadMoreTextScreenState();
}

class _ReadMoreTextScreenState extends State<ReadMoreTextScreen> {

  bool isReadMore = false;

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Read More Text'),
    //     centerTitle: true,
    //     backgroundColor: Colors.yellow.shade600,
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.all(20),
    //     child: ListView(
    //       children:  [
    //         const Text('Lorem Ipsum',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
    //         const SizedBox(height: 20),
    //          Text('Lorem ipsum dolor sit amet. Quo voluptates ratione non soluta excepturi nam ducimus enim est ipsa tempora ea consequatur quia. Hic quidem porro ut quisquam quaerat aut quod autem? Vel cumque porro qui numquam quam et voluptatem quidem in adipisci quae quo iste perspiciatis eos cumque consequuntur 33 eaque cumque Sed natus explicabo et dolores deleniti eum soluta omnis? Vel culpa expedita qui dolorem inventore est distinctio temporibus et accusantium libero ab voluptatem quisquam et voluptatem commodi. Et quia repellat et eligendi sunt At voluptate quas qui autem modi vel mollitia dolor sit cumque totam ea omnis incidunt. Ea eius commodi ut maxime provident sed rerum officiis. Et assumenda sapiente in mollitia dignissimos aut eveniet galisum aut accusantium repudiandae eos voluptatem dolor ea galisum temporibus et molestiae quia.',
    //         maxLines: isReadMore ? null : 5,
    //           overflow: isReadMore ? TextOverflow.visible : TextOverflow.ellipsis,
    //           style: const TextStyle(fontSize: 20,height: 2),
    //         ),
    //         const SizedBox(height: 20),
    //         Container(
    //           alignment: Alignment.centerLeft,
    //           child: buildButton(),
    //         )
    //       ],
    //     ),
    //   ),
    // );
    return Scaffold(
        appBar: AppBar(
            title: const Text('Read More Text'),
            centerTitle: true,
            backgroundColor: Colors.yellow.shade600,
          ),
      body:  Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:const [
             Text('Read More Text',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                   SizedBox(height: 20),
            ReadMoreText(
              'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
              trimLines: 2,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Read more',
              trimExpandedText: 'Read less',
              moreStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              lessStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              style: TextStyle(fontSize: 17,height: 2),
            ),
          ],
        ),
      ),
    );
  }

  buildButton(){
    return ElevatedButton(onPressed: (){
      setState(() {
        isReadMore = !isReadMore;
      });
    }, child: Text(isReadMore ? 'Read Less' : 'Read More'));
  }
}
