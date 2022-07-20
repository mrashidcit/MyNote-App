import 'package:get/get.dart';
import 'package:note_app/data/model/NoteModel.dart';
import 'package:note_app/data/repository/note_repository.dart';
import 'package:meta/meta.dart';
import 'package:note_app/routes/app_pages.dart';

class NotesListController extends GetxController {
  final NoteRepository repository;

  NotesListController({required this.repository}) : assert(repository != null);

  // List<NoteModel> testList = List.empty(growable: true);
  // final List<NoteModel> testList = <NoteModel>[];
  // RxList<NoteModel> _itemsList = (List.of<NoteModel>([])).obs;
  // RxList<NoteModel> _itemsList = <NoteModel>[].obs;
  // final _itemsList = <NoteModel>[].obs;
  final _itemsList = List.empty(growable: true).obs;

  get notesList => this._itemsList.value;
  set notesList(value) => this._itemsList.value = value;

  final _note = NoteModel().obs;
  get note => this._note.value;
  set note(value) => this._note.value = value;

  getAll() {
    repository.getAll().then((data) => notesList = data);
  }

  searchItems(String searchStr) {
    repository.searchItems(searchStr).then((data) => notesList = data);
  }

  insertItem(NoteModel noteModel) {
    _itemsList.add(noteModel);
  }

  removeItem(NoteModel noteModel) {
    repository.removeItem(noteModel);
    _itemsList.remove(noteModel);
  }

  addNewNote() {
    Get.toNamed(Routes.ADD_NOTE)?.then((result) {
      if (result[0]['is_item_inserted'] == true) {
        insertItem(result[0]['item']);
        // Get.snackbar('', 'Successfully Saved!').show();
      }
    }).onError((error, stackTrace) => null);
  }
}
