class ValidationMixins {
  String validateEmail (String value){
    if (!value.contains("@")){
      return "Adresse email invalide";
    }
    return null;
  }
  String validatePassword (String value){
    if (value.length < 6){
        return "Le mot de passe doit contenir au moins 6 caractères";
    }
    return null;
  }
}