import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:zaxo/src/resources/repository.dart';
import 'dart:async';
import '../models/user_model.dart';

class NewDbProvider implements Source, Cache{
  Database db;

  NewDbProvider(){
    init();
  }
  @override
  Future<List<int>> fetchTopIds() {
    // TODO: implement fetchTopIds
    return null;
  }
  void init() async{
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, "user.db");

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database newDb, int version){
        newDb.execute("""
          CREATE TABLE Users
            (
              id INTEGER PRIMARY KEY,
              email TEXT
              password TEXT
            )
        """);
      }
    );
  }

  fetchUser(int id) async{
    final maps = await db.query(
      "Users",
      columns: null,
      where: "id = ?",
      whereArgs: [id],
    );

    if(maps.length > 0){
      return UserModel.fromDb(
        maps.first
      );
    }
    return null;
  }

  Future <int> addUser(UserModel user){
    return db.insert("Users", user.toMap());
  }
}
final NewDbProvider newDbProvider = NewDbProvider();