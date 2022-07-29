import 'package:crud_list_map/model/student.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key,required this.icon,required this.name}) : super(key: key);
  final IconData icon;
  final String name;
  @override
  Widget build(BuildContext context) {
    final myProvide = Provider.of<Student>(context,listen: true);
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(icon),
        label: Text(name),
      ),
      controller: name=='Name'?myProvide.nameController:myProvide.emailController,
    );
  }
}
