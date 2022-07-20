import 'package:note_app/data/model/NoteModel.dart';
import 'package:meta/meta.dart';
import 'package:note_app/data/provider/my_db.dart';
import 'package:sqflite/sqlite_api.dart';

class DBClient {
  late Database _db;

  Database get db => _db;

  DBClient() {
    // MyDB.getInstance().then((value) => _db = value.database);
    _db = MyDB.getInstance().database;
  }

  // getAll() async {
  //   List<NoteModel> noteList = List.empty(growable: true);
  //   noteList.add(NoteModel(title: 'Title 1', body: 'Description 1'));
  //   noteList.add(NoteModel(title: 'Title 2', body: 'Description 2'));
  //   noteList.add(NoteModel(title: 'Title 3', body: 'Description 3'));

  //   return noteList;
  // }

  Future<List<NoteModel>> getAll() async {
    List<NoteModel> noteList = List.empty(growable: true);
    List<Map<String, Object?>> maps = await db.query(
      tableNotes,
      columns: [columnId, columnTitle, columnDescription],
    );
    if (maps.length > 0) {
      maps.forEach((element) {
        noteList.add(NoteModel.fromMap(element));
      });
    }
    return noteList;
  }

  Future<List<NoteModel>> searchItems(String searchStr) async {
    List<NoteModel> noteList = List.empty(growable: true);
    List<Map<String, Object?>> maps = await db.query(tableNotes,
        columns: [columnId, columnTitle, columnDescription],
        where: '$columnTitle LIKE ? OR $columnDescription LIKE ?',
        whereArgs: ['%$searchStr%', '%$searchStr%']);
    if (maps.length > 0) {
      maps.forEach((element) {
        noteList.add(NoteModel.fromMap(element));
      });
    }
    return noteList;
  }

  Future<NoteModel> insert(NoteModel item) async {
    item.id = await db.insert(tableNotes, item.toMap());
    return item;
  }

  Future<int> delete(int id) async {
    return await db.delete(tableNotes, where: '$columnId = ?', whereArgs: [id]);
  }
}
