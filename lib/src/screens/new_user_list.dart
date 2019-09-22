import 'package:flutter/material.dart';

class NewUserList extends StatefulWidget{
  Widget build(context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Nos Utilisateurs"),
      ),
      body: Text("Ici tous les utilateurs inscrits sur zaxo"),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}