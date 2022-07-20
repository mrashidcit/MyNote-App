import 'package:get/get.dart';
import 'package:note_app/data/model/NoteModel.dart';
import 'package:note_app/data/repository/note_repository.dart';

class AddNoteController extends GetxController {
  final NoteRepository repository;

  AddNoteController({required this.repository}) : assert(repository != null);

  insertNote(NoteModel noteModel) {
    // var item = await repository.insertItem(noteModel);
    // Get.back(result: [
    //   {'is_item_inserted': true, 'item': item}
    // ]);
    // Get.closeCurrentSnackbar();
    // Get.snackbar('', 'Successfully Saved!').show();

    repository.insertItem(noteModel).then((item) {
      Get.back(result: [
        {'is_item_inserted': true, 'item': item}
      ]);
      // Get.snackbar('', 'Successfully Saved!').show();
    });
  }
}
