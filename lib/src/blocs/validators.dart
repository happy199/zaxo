import 'dart:async';

class Validators{
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){
      if (email.contains("@")){
        sink.add(email);
      }else{
        sink.addError("Adresse Email incorrecte");
      }
    }
  );
  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink){
      if (password.length < 6){
        sink.add(password);
      }else{
        sink.addError("Le mot de passe doit contenir au moins 6 caractères");
      }
    }
  );
}