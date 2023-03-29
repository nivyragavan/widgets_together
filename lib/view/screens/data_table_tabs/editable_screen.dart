import 'package:flutter/material.dart';

import '../../../model/user_model.dart';


class EditableScreen extends StatelessWidget {
  const EditableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Editable Screen'),
      ),
    );
  }

  // buildDataTable(){
  //   final columns = ['First Name','Last Name','Age'];
  //   return DataTable(columns:getColumns(columns),
  //        rows: getRows(users)
  //   );
  // }
  //
  // List<DataColumn> getColumns(List<String> columns) {
  //   return columns.map((String column){
  //     return DataColumn(label: Text(column));
  //   }).toList();
  // }
  //
  // List<DataRow> getRows(List<User> users) => users.map((User user){
  //
  //   final cells = [user.firstName,user.lastName,user.age];
  //
  //   return DataRow(cells: Utils.modelBu)
  //
  // }).toList();
}
