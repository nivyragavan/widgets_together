import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RefreshIndicatorScreen extends StatefulWidget {
  const RefreshIndicatorScreen({Key? key}) : super(key: key);

  @override
  State<RefreshIndicatorScreen> createState() => _RefreshIndicatorScreenState();
}

class _RefreshIndicatorScreenState extends State<RefreshIndicatorScreen> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3'];

  Future refresh() async {
    setState(() {
      items.clear();
    });
    const url = "https://jsonplaceholder.typicode.com/posts";
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List newItems = json.decode(response.body);

      setState(() {
        items = newItems.map<String>((item) {
          final number = item["id"];
          return "Item $number";
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Refresh Indicator'),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: items.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: refresh,
              child: ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(items[index]),
                    );
                  }),
            ),
    );
  }
}
