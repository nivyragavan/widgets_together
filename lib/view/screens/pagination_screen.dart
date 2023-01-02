import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PaginationScreen extends StatefulWidget {
  const PaginationScreen({Key? key}) : super(key: key);

  @override
  State<PaginationScreen> createState() => _PaginationScreenState();
}

class _PaginationScreenState extends State<PaginationScreen> {
  final scrollController = ScrollController();
  List postModel = [];
  int page = 1;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);
    fetchPosts();
  }

  Future<void> scrollListener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      page = page + 1;
      setState(() {
        isLoading = true;
      });
      await fetchPosts();
      setState(() {
        isLoading = false;
      });
      print("Scroll Listener called");
    } else {
      print("Scroll Listener didn\'t called");
    }
  }

  Future<void> fetchPosts() async {
    const url =
        'https://techcrunch.com/wp-json/wp/v2/posts?context=embed&per_page=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      print(response.body.toString());
      final json = jsonDecode(response.body) as List;
      setState(() {
        postModel = postModel + json;
      });
    } else {
      print('Unexpected response');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scroll Pagination'),
        centerTitle: true,
        backgroundColor: Colors.green.shade300,
      ),
      body: SafeArea(
        child: ListView.builder(
            padding: const EdgeInsets.all(10),
            controller: scrollController,
            itemCount: isLoading ? postModel.length + 1 : postModel.length,
            itemBuilder: (context, index) {
              if (index < postModel.length) {
                final post = postModel[index];
                final title = post['title']['rendered'];
                final body = post['excerpt']['rendered'];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(child: Text('${index + 1}')),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(title.toString()),
                    ),
                    subtitle: Text(body.toString()),
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
