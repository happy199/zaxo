import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:zaxo/src/resources/repository.dart';
import '../models/user_model.dart';

final root = 'https://hacker-news.firebaseio.com/v0';

class NewApiProvider implements Source{
  
  Client client = new Client();
  
  Future<List <int>> fetchTopIds() async{
    final response = await client.get('$root/topstories.json');
    final ids = json.decode(response.body);
    return ids.cast<int>();
  }
  
  Future <UserModel> fetchUser(int id) async {
    final response = await client.get('$root/item/$id.json');
    final parsedJson = json.decode(response.body);
    return UserModel.fromJson(parsedJson);
  }
}