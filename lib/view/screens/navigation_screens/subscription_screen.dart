import 'package:flutter/material.dart';

import '../../../model/subscription_model.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  List<Subscription> subscription = [
    Subscription(product: 'Silver', amount: '\u{20b9} 2000'),
    Subscription(product: 'Gold', amount: '\u{20b9} 3000'),
    Subscription(product: 'Platinum', amount: '\u{20b9} 4000')
  ];

  int selectedItem = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscription'),
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: subscription.length,
          itemBuilder: (context, index) {
            var e = subscription[index];
            return GestureDetector(
              onTap: () {
                 setState(() {
                  selectedItem = index;
                });
              },
              child:  Container(
                width: double.infinity,
                height: 120,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 10,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: selectedItem == index
                                ? const BorderSide(color: Colors.red, width: 2)
                                : BorderSide.none),
                        child: ListTile(
                          title: Text(e.product),
                          subtitle: Text(e.amount),
                          trailing: selectedItem == index ? const Icon(Icons.check_circle,color: Colors.red,):const Text(''),
                        ),
                      ),
                    ),
                     index == 1 ? Container(width: 200,height: 30,color: Colors.blue,):Container(),

                  ],
                ),
              )
                //   : Card(
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(15),
                //     side: selectedItem == index
                //         ? const BorderSide(color: Colors.red, width: 2)
                //         : BorderSide.none),
                //       child: ListTile(
                //         title: Text(e.product),
                //         subtitle: Text('${e.amount} index 1'),
                //       ),
                //     ),
            );
          }),
    );
  }
}
