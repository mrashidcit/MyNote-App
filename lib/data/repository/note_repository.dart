import 'package:note_app/data/model/NoteModel.dart';
import 'package:note_app/data/provider/db_client.dart';

class NoteRepository {
  final DBClient dbClient;

  NoteRepository({required this.dbClient}) : assert(dbClient != null);

  getAll() {
    return dbClient.getAll();
  }

  searchItems(String searchStr) {
    return dbClient.searchItems(searchStr);
  }

  Future<NoteModel> insertItem(NoteModel noteModel) async {
    return await dbClient.insert(noteModel);
  }

  removeItem(NoteModel noteModel) {
    return dbClient.delete(noteModel.id);
  }
}
