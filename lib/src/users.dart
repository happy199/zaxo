import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../src/screens/new_user_list.dart';

class User extends StatelessWidget{
  Widget build(context){
    return MaterialApp(
      title: "Utilisateurs",
      home: NewUserList(),
    );
  }
}