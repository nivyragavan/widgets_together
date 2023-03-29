import'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_widgets/model/book_model.dart';

import 'listview_navigation/book_list_screen.dart';


class SearchFilterScreen extends StatefulWidget {
  const SearchFilterScreen({Key? key}) : super(key: key);

  @override
  State<SearchFilterScreen> createState() => _SearchFilterScreenState();
}

class _SearchFilterScreenState extends State<SearchFilterScreen> {

  final controller = TextEditingController();

  List<Book> books = allBooks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search & Filter'),
        centerTitle: true,
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Book title',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.lightGreenAccent)
                ),
              ),
              onChanged: searchBook,
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: books.length,
              itemBuilder: (context,index){
              final book = books[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                leading: Image.network(book.urlImage),
                title: Text(book.title),
                onTap: (){
                  Get.to(BookListScreen(book: book));
                },
              ),
            );
          }))
        ],
      ),
    );
  }

  void searchBook (String query){
    final suggestions = allBooks.where((book){
      final bookTitle = book.title.toLowerCase();
      final input = query.toLowerCase();

      return bookTitle.contains(input);
    }).toList();
    setState(() {
      books = suggestions;
    });
  }
}