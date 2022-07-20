import 'package:get/get.dart';
import 'package:note_app/data/provider/db_client.dart';
import 'package:note_app/data/repository/note_repository.dart';
import 'package:note_app/modules/add_note/add_note_controller.dart';

class AddNoteBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddNoteController>(() =>
        AddNoteController(repository: NoteRepository(dbClient: DBClient())));
  }
}
