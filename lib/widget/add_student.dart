import 'package:crud_list_map/design/custom_text_field.dart';
import 'package:crud_list_map/model/student.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddStudent extends StatelessWidget {
  const AddStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myProvide = Provider.of<Student>(context,listen: true);
    return FloatingActionButton(
      backgroundColor: Colors.blue[200],
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('ADD NEW STUDENT'),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Form(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: const [
                              CustomTextField(icon: Icons.account_box, name: 'Name'),
                              CustomTextField(icon: Icons.email, name: 'Email'),
                            ],
                          ),
                        )),

                  ],
                ),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        myProvide.addData(myProvide.nameController.text, myProvide.emailController.text);
                        myProvide.nameController.clear();
                        myProvide.emailController.clear();
                        Navigator.pop(context);
                      },
                      child: const Text('Submit'))
                ],
              );
            },
          );
        });
  }
}
