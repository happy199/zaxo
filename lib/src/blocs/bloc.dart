import 'dart:async';
import 'validators.dart';

class Bloc extends Object with Validators{
  final _email = StreamController<String>.broadcast();
  final _password = StreamController<String>.broadcast();

  // Add data to stream 
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  // Change data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  void dispose(){
    _email.close();
    _password.close();
  }
}
final bloc = Bloc();