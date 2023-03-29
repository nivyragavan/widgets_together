import 'package:flutter/material.dart';
import 'package:new_widgets/view/screens/data_table_tabs/editable_screen.dart';
import 'package:new_widgets/view/screens/data_table_tabs/selectable_screen.dart';
import 'package:new_widgets/view/screens/data_table_tabs/sortable_screen.dart';


class DataTableScreen extends StatelessWidget {
  const DataTableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3, child:Scaffold(
      appBar: AppBar(
        title: const Text('Data Table'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        bottom:  const TabBar(
          indicatorColor: Colors.white,
            indicatorWeight: 5,
            tabs: [
          Tab(icon:Icon(Icons.edit),text: 'Editable',),
          Tab(icon:Icon(Icons.sort_by_alpha),text: 'Sortable',),
          Tab(icon:Icon(Icons.select_all),text: 'Selectable',),
        ]),
      ),
      body: const TabBarView(children: [
        EditableScreen(),
        SortableScreen(),
        SelectableScreen()
      ]),
    ));
  }
}
