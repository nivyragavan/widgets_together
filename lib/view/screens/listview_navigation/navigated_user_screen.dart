import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/listview_navigation_model.dart';

class NavigationUserScreen extends StatelessWidget {
  final User user;

  const NavigationUserScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.username),
      ),
      body: Column(
        children: [
          Image.network(
            user.url,
            height: 500,
            width: Get.width,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            user.username,
            style: const TextStyle(fontSize: 30),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(user.email, style: const TextStyle(fontSize: 20))
        ],
      ),
    );
  }
}
