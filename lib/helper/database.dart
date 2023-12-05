import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'package:water_tank_clean_service/data/model/response/quotationdb.dart';

class QuotationDb {
  Database? _database;

  Future<Database?> get db async {
    if (_database != null) {
      return _database;
    }
    _database = await openDb();
    return _database;
  }

  Future openDb() async {
    _database = await openDatabase(join(await getDatabasesPath(), "quotation.db"),
        version: 1, onCreate: (Database db, int version) async {
          await db.execute(
            "CREATE TABLE quotation(id INTEGER PRIMARY KEY autoincrement,tankSize INTEGER,tankType INTEGER,tankTypename TEXT,waterType TEXT,amount INTEGER)",
          );
        });
    print('db location : $_database');
    return _database;
  }

  Future insertModel(InsertQuotationBody insertQuotationBody) async {
    await openDb();
    insertQuotationBody.id = await _database!.insert('quotation', insertQuotationBody.toJson());
    print('model list : ${insertQuotationBody.tankTypename}:::${ConflictAlgorithm.replace}');
    return insertQuotationBody;
  }

  Future<List<InsertQuotationBody>> getModelList() async {
    await openDb();
    final  List<Map<String, dynamic>> maps = await _database!.query('quotation',columns: ['id','tankSize','tankType','tankTypename','waterType','amount']);
    return List.generate(maps.length, (i) {
      print("map::1:::${maps.toList().toString()}::::::${maps[i]['tankTypename']}");
      return InsertQuotationBody(
          id: maps[i]['id'],
          tankSize: maps[i]['tankSize'],
          tankType: maps[i]['tankType'],
          tankTypename: maps[i]['tankTypename'],
          waterType: maps[i]['waterType'],
          amount: maps[i]['amount']);
    }).toList();
  }

  Future<int> updateModel(InsertQuotationBody insertQuotationBody) async {
    await openDb();
    return await _database!.update('quotation', insertQuotationBody.toJson(),
        where: "id = ?", whereArgs: [insertQuotationBody.id]);
  }

  Future<void> deleteModel(InsertQuotationBody insertQuotationBody) async {
    await openDb();
    print("delete::$insertQuotationBody");
    await _database!.delete('quotation', where: "id = ?", whereArgs: [insertQuotationBody.id]);
  }

  Future close() async {
    var dbClient = _database;
    dbClient!.close();
  }

  Future deleteAll() async {
    var dbClient = await db;
    dbClient!.delete('quotation');
  }

}
