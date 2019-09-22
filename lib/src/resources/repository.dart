import 'dart:async';
import 'new_api_provider.dart';
import 'new_db_provider.dart';
import '../models/user_model.dart';

class Repository{
  List<Source> sources = <Source>[
    newDbProvider,
    NewApiProvider(),
  ];
  List<Cache> caches = <Cache>[
    newDbProvider,
  ];

  Future<List <int>> fetchTopIds(){
    return sources[1].fetchTopIds();
  }
  
   Future <UserModel> fetchUser(int id) async {
    UserModel user;
    Source source;

    for (source in sources){
      user = await source.fetchUser(id);
      if (user!=null){
        break;
      }
    }

    for (var cache in caches){
      cache.addUser(user);
    }
    return user;
  }
}
abstract class Source{
  Future<List <int>> fetchTopIds();
  Future <UserModel> fetchUser(int id);
}

abstract class Cache{
  Future <int> addUser(UserModel user);
}