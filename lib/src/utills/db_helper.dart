import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite_practice/src/model/card_model.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' show join;

/// abstract to hide the details of main implementation of dbhelper
/// static instance will be passed
abstract class Repository {
  factory Repository() => _Repository();

  add(CardModel model);
  update(CardModel model);
  delete(id);
  Future<List<CardModel>> read();
}

class _Repository implements Repository {
  factory _Repository() => _this ??= _Repository._();
  static _Repository? _this;
  _Repository._();

  /// constant final variables for redundant use
  final String _dbName = "Guests_04.db";
  final String _tableName = "Guests";
  final String colunmId = "id";
  final String colunmName = "name";
  final String colunmColor = "color";
  final int _dbVersion = 2;
  Database? _database;

  /// this method will initialize the _database instance if null
  _initDb() async {
    /// this will get the application directory to store
    /// db file and add the joined name file in the directory
    /// and return the database instacne of that path.
    Future<Database> _initDataBasePath() async {
      /// this will trigger when the db will be activated / created
      onCreate(Database db, int version) async {
        await db.execute('''CREATE TABLE $_tableName (
                          $colunmId	INTEGER,
                          $colunmName	TEXT NOT NULL,
                          $colunmColor TEXT NOT NULL,
                          PRIMARY KEY("id" AUTOINCREMENT))''');
      }

      /// get the applications directory e.g *** android/0/Android/data/...
      Directory dbPath = await getApplicationDocumentsDirectory();

      String path = join(dbPath.path, _dbName);

      /// return the instance of database with table and file created
      return await openDatabase(
        path,
        version: _dbVersion,
        onCreate: onCreate,
      );
    }

    return _database ??= await _initDataBasePath();
  }

  /// return the database instance
  get database async => await _initDb();

  /// add by map
  @override
  add(CardModel model) async {
    Database db = await _this!.database;
    await db.insert(_tableName, model.toMap());
  }

  /// delete by id
  @override
  delete(id) async {
    Database db = await _this!.database;
    await db.delete(_tableName, where: '$colunmId = ?', whereArgs: [id]);
  }

  /// get all the coverted list of models
  @override
  Future<List<CardModel>> read() async {
    Database db = await _this!.database;
    var data = await db.query(_tableName);

    /// covert to list of models
    return data.map<CardModel>((e) => CardModel.fromMap(e)).toList();
  }

  /// update by id
  @override
  update(CardModel model) async {
    Database db = await _this!.database;
    await db.update(_tableName, model.toMap(),
        where: '$colunmId = ?', whereArgs: [model.id]);
  }
}
