import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_widgets/view/screens/listview_navigation/navigated_user_screen.dart';

import '../../model/listview_navigation_model.dart';

class ListviewNavigationScreen extends StatelessWidget {
  ListviewNavigationScreen({Key? key}) : super(key: key);

  List<User> users = [
    User(
        username: 'Nivy',
        email: 'nivy.vts@gmail.com',
        url:
            'https://mymodernmet.com/wp/wp-content/uploads/2019/09/100k-ai-faces-5.jpg'),
    User(
        username: 'Ragavan',
        email: 'ragavan@gmail.com',
        url:
            'https://mymodernmet.com/wp/wp-content/uploads/2019/09/100k-ai-faces-6.jpg')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listview Navigation'),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(users[index].url),
                ),
                title: Text(users[index].username),
                subtitle: Text(users[index].email),
                trailing: const Icon(Icons.arrow_forward_rounded),
                onTap: () {
                  Get.to(NavigationUserScreen(user: users[index]));
                },
              ),
            );
          }),
    );
  }
}
