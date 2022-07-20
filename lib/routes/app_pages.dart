import 'package:get/route_manager.dart';
import 'package:note_app/modules/add_note/add_note_binding.dart';
import 'package:note_app/modules/add_note/add_note_page.dart';
import 'package:note_app/modules/notes_list/notes_list_binding.dart';
import 'package:note_app/modules/notes_list/notes_list_page.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => NotesListPage(),
      binding: NotesListBinding(),
    ),
    GetPage(
      name: Routes.ADD_NOTE,
      page: () => AddNotePage(),
      binding: AddNoteBinding(),
    ),
  ];
}
