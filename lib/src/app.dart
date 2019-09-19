import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

class App extends StatelessWidget{
  Widget build(context){
    return MaterialApp(
      title: "Connecte moi",
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: LoginScreen(),)
    );
  }
}