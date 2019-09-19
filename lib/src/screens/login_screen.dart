import 'package:flutter/material.dart';
import '../mixins/validation_mixins.dart';
class LoginScreen extends StatefulWidget{
    createState(){
      return LoginScreenState();
    }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixins{
  final formKey = GlobalKey<FormState>(); 
  Widget build(context){
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Adresse E-mail",
        hintText: "example@ex.com",
        // errorText: snapshot.error,
      ),
      validator: validateEmail,
      onSaved:(String value){
        print(value);
      },
    );
  }
  Widget passwordField(){
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: "Mot de passe ",
          hintText: "********",
          // errorText: snapshot.error,
        ),
        validator: validatePassword,
        onSaved:(String value){
          print(value);
        },
      ),
    );
  }
  Widget submitButton(){
    return RaisedButton(
      color: Colors.greenAccent,
      child: Text("Me Connecter"),
      onPressed: (){
        if (formKey.currentState.validate()){
          formKey.currentState.save();
          formKey.currentState.reset();
        }
      },
    );
  }
}