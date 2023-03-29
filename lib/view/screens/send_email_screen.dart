import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_widgets/service/api_service.dart';


class SendEmailScreen extends StatefulWidget {
  const SendEmailScreen({Key? key}) : super(key: key);

  @override
  State<SendEmailScreen> createState() => _SendEmailScreenState();
}

class _SendEmailScreenState extends State<SendEmailScreen> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final subjectController = TextEditingController();
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Email'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Name',style: TextStyle(fontSize: 17),),
            const SizedBox(height: 10),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(),
                hintText: 'Enter Name'
              ),
            ),
            const SizedBox(height: 15),
            const Text('Email',style: TextStyle(fontSize: 17),),
            const SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(),
                  hintText: 'Enter Email'
              ),
            ),
            const SizedBox(height: 15),
            const Text('Subject',style: TextStyle(fontSize: 17),),
            const SizedBox(height: 10),
            TextField(
              controller: subjectController,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(),
                  hintText: 'Enter Subject'
              ),
            ),
            const SizedBox(height: 15),
            const Text('Message',style: TextStyle(fontSize: 17),),
            const SizedBox(height: 10),
            TextField(
              controller: messageController,
              maxLines: 10,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(),
                  hintText: 'Enter Message',
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(Get.width, 45)
              ),
                onPressed: (){
                 ApiService().sendEmail(name: nameController.text, email: emailController.text, subject: subjectController.text, message: messageController.text);
                },
                child: const Text('Send',style: TextStyle(fontSize: 17),))
          ],
        ),
      ),
    );
  }
}
