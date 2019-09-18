import 'package:flutter/material.dart';
import '../blocs/bloc.dart';

final bloc = Bloc();
class LoginScreen extends StatefulWidget{
    createState(){
      return LoginScreenState();
    }
}

class LoginScreenState extends State<LoginScreen>{
  final formKey = GlobalKey<FormState>(); 
  String email = "";
  String password = "";
  Widget build(context){
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(margin: EdgeInsets.only(top: .0),),
            emailField(),
            Container(margin: EdgeInsets.only(top: 25.0),),
            passwordField(),
            submitButton()
          ],
        ),
      ),
    );
  }

  Widget emailField(){
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot){
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: "Adresse E-mail",
            hintText: "example@ex.com",
            errorText: snapshot.error,
          ),
        );
      },
    );
  }
  Widget passwordField(){
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot){
        return Container(
          margin: EdgeInsets.only(bottom: 20.0),
          child: TextField(
            onChanged: bloc.changePassword,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Mot de passe ",
              hintText: "********",
              errorText: snapshot.error,
            ),
          ),
        );
      },
    );
  }
  Widget submitButton(){
    return RaisedButton(
      color: Colors.greenAccent,
      child: Text("Me Connecter"),
      onPressed: (){
        if (formKey.currentState.validate()){
          formKey.currentState.save();
        }
      },
    );
  }
}