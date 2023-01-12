import 'package:flutter/material.dart';

class ReorderableListviewScreen extends StatefulWidget {
  const ReorderableListviewScreen({Key? key}) : super(key: key);

  @override
  State<ReorderableListviewScreen> createState() =>
      _ReorderableListviewScreenState();
}

class _ReorderableListviewScreenState extends State<ReorderableListviewScreen> {
  final items = ['item 1', 'item 2', 'item 3', 'item 4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reorderable Listview'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: ReorderableListView(
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (newIndex > oldIndex) newIndex--;
            final item = items.removeAt(oldIndex);
            items.insert(newIndex, item);
          });
        },
        children: [
          for (final item in items)
            ListTile(
              key: ValueKey(item),
              title: Text(item),
            )
        ],
      ),
    );
  }
}
