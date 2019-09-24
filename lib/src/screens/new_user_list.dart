import 'package:flutter/material.dart';

class NewUserList extends StatelessWidget{
  Widget build(context){
    return Scaffold(
      body: buildList(),
    );
  }
  Widget buildList(){
    return ListView.builder(
      itemCount: 1000,
      itemBuilder: (context, int index){
        return FutureBuilder(
          future: getFuture(),
          builder: (context, snapshot){
            return Container(
              height: 80.0,
              child: snapshot.hasData
                ? Text ('$index')
                : Text ('En cours de chargement $index'),
            );
          },
        );
      },
    );
  }
  getFuture(){
    return Future.delayed(
      Duration(seconds: 2),
      () => "Hi",
    );
  }
}