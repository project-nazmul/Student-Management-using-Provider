import 'package:crud_list_map/model/student.dart';
import 'package:crud_list_map/widget/add_student.dart';
import 'package:crud_list_map/widget/custom_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myProvide = Provider.of<Student>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: const Text('Student Info'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: myProvide.students.length,
        itemBuilder: (context, index) {
          return CustomTile(index: index);
        },
      ),
      floatingActionButton: const AddStudent(),
    );
  }
}

