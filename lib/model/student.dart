import 'package:flutter/material.dart';

class Student extends ChangeNotifier{

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  List students = [
     {"name":"Nazmul Khan","email":"nazmul@gmail.com"},
     {"name":"Rahim Khan","email":"rahim@gmail.com"},
     {"name":"Karim Khan","email":"karim@gmail.com"},
     {"name":"Zahid Khan","email":"zahid@gmail.com"},
     {"name":"Rafiq Khan","email":"rafiq@gmail.com"},
  ];

   addData(String n, String e){
    students.add(
        {"name":n,"email":e}
    );
    notifyListeners();

  }

   updateData(int index,String n, String e){
    students.replaceRange(index, index+1, [{"name":n,"email":e}]);
    notifyListeners();
  }

  deleteData(int index){
    students.removeAt(index);
    notifyListeners();
  }
}