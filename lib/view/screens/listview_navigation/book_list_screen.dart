import 'package:flutter/material.dart';
import 'package:new_widgets/model/book_model.dart';


class BookListScreen extends StatelessWidget {

  final Book book;

  const BookListScreen({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
        centerTitle: true,
      ),
      body: Center(child: Image.network(book.urlImage)),
    );
  }
}
