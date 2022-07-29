import 'package:crud_list_map/design/custom_text_field.dart';
import 'package:crud_list_map/model/student.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditStudent extends StatelessWidget {
  const EditStudent({Key? key,required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    final myProvide = Provider.of<Student>(context,listen: true);
    return IconButton(
        onPressed: () {
          myProvide.nameController.text = myProvide.students[index]["name"];
          myProvide.emailController.text = myProvide.students[index]["email"];
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        myProvide.updateData(index, myProvide.nameController.text, myProvide.emailController.text);
                        myProvide.nameController.clear();
                        myProvide.emailController.clear();
                        Navigator.pop(context);
                      },
                      child: const Text('Submit'))
                ],
                title:const Text('EDIT STUDENT INFO') ,
                content:Column(
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
                ) ,
              );
            },
          );
        },
        icon: const Icon(Icons.edit));
  }
}
