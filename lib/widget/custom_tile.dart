import 'package:crud_list_map/model/student.dart';
import 'package:crud_list_map/widget/edit_student.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({Key? key,required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    final myProvide = Provider.of<Student>(context,listen: true);
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 10,
      child: ListTile(
        tileColor: Colors.blue[100],
        leading: CircleAvatar(
          backgroundColor: Colors.blue[200],
            child: Text(
              myProvide.students[index]["name"][0],
            )),
        title: Text(myProvide.students[index]["name"]),
        subtitle: Text(myProvide.students[index]["email"]),
        trailing: FittedBox(
          child: Row(
            children: [
              EditStudent(index: index,),
              IconButton(
                  onPressed: () {
                    myProvide.deleteData(index);
                  },
                  icon: const Icon(Icons.delete)),
            ],
          ),
        ),
      ),
    );
  }
}
