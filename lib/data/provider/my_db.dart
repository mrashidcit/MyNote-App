import 'package:sqflite/sqflite.dart';

class MyDB {
  static MyDB? _instance = null;

  late Database _db;

  Database get database => _db;

  static Future<MyDB> createInstance() async {
    print('> createInstance : started');
    if (_instance == null) {
      _instance = MyDB();
      await _instance?.createDb();
    }

    print('> createInstance : completed');
    return _instance!;
  }

  static MyDB getInstance() => _instance!;

  MyDB() {
    createDb();
  }

  Future<Database> createDb() async {
    print('> createDb : started');
    _db = await openDatabase('my_db.db', version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Notes (id INTEGER PRIMARY KEY, title TEXT, description TEXT)');
    });
    print('> createDb : completed');
    return _db;
  }

  closeDb() async {
    await _db.close;
  }
}
