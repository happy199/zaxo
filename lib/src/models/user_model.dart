class UserModel{
  final int id;
  final String email;
  final String password;
  
  UserModel.fromJson(Map<String, dynamic>parsedJson)
    : id = parsedJson['id'],
      email = parsedJson['email'],
      password = parsedJson['password'];
  
  UserModel.fromDb(Map<String, dynamic>parsedJson)
    : id = parsedJson['id'],
      email = parsedJson['email'],
      password = parsedJson['password'];

  Map<String, dynamic> toMap(){
    return <String, dynamic>{
      "id":id,
      "email":email,
      "password":password
    };
  }
}