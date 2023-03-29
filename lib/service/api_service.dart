import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/post_model.dart';

class ApiService {
  static Future<String?> fetchUrl(Uri uri,
      {Map<String, String>? headers}) async {
    try {
      final response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<List<PostModel>> fetchPosts() async {
    const url = 'https://jsonplaceholder.typicode.com/posts';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      print(response.body.toString());
      var json = response.body;
      return postModelFromJson(json);
    } else {
      return null!;
    }
  }

  Future sendEmail({required String name,required String email,required String subject,required String message}) async {
    const serviceId = 'service_nztrsuh';
    const templateId = 'template_4zygqe7';
    const userId = 'M9onZPDxMMUfYIsgB';
    const url = 'https://api.emailjs.com/api/v1.0/email/send';
    final uri = Uri.parse(url);
    final response =await http.post(uri,
        headers: {
      'origin':'http://localhost',
      'Content-Type':'application/json'},
        body: json.encode({
      'service_id':serviceId,
      'template_id':templateId,
      'user_id':userId,
          'template_params':{
        'user_name':name,
            'user_email':email,
            'to_email':'other.email@gmail.com',
            'user_subject':subject,
            'user_message':message,
          },
    }));
    print(response.body);
  }
}
