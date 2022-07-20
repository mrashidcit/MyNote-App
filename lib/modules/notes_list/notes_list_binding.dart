import 'package:get/get.dart';
import 'package:note_app/data/provider/db_client.dart';
import 'package:note_app/data/repository/note_repository.dart';
import 'package:note_app/modules/notes_list/notes_list_controller.dart';

class NotesListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotesListController>(() {
      return NotesListController(
          repository: NoteRepository(dbClient: DBClient()));
    });
  }
}
