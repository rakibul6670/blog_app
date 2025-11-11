import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  // Database helper methods will be implemented here
  // singleton pattern implementation
  DBHelper.DBConstructor();
  static get instance => DBHelper.DBConstructor();

  // database initialization and CRUD operations will be added here
  Database? _database;

  //------------ table creation variables ---------
  String tableBookmarks = "bookmarks";
  String colId = "id";
  String colTitle = "title";
  String colBody = "body";

  // Get database instance
  Future<Database> getDB() async {
    if (_database != null) {
      return _database!;
    }
    // initialize database
    else {
      return _database = await openDB();
    }
  }

  //---- Open database -----
  Future<Database> openDB() async {
    // documents derectory path
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String dbPath = join(documentsDirectory.path, "bookmarks.db");
    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
Create table bookmarks (
id integer primary key autoincrement,

)

''');
      },
    );
  }
}
