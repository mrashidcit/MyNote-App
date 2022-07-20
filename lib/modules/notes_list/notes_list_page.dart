import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/modules/notes_list/notes_list_controller.dart';
import 'package:note_app/routes/app_pages.dart';
import 'package:note_app/widgets/load_widget.dart';
import './local_widgets/list_item.dart';

class NotesListPage extends StatefulWidget {
  NotesListPage({Key? key}) : super(key: key);

  @override
  State<NotesListPage> createState() => _NotesListPageState();
}

class _NotesListPageState extends State<NotesListPage> {
  NotesListController controller = Get.find<NotesListController>();
  final textSearchController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    textSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            // Get.toNamed(Routes.ADD_NOTE);
            controller.addNewNote();
          }),
      body: SafeArea(
        child: Column(
          children: [
            // Row(
            //   children: [
            //     Container(
            //       padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            //       // width: 100,
            //       // height: 80,
            //       child: TextField(
            //         decoration: InputDecoration(
            //           border: OutlineInputBorder(),
            //           hintText: 'Search ...',
            //         ),
            //       ),
            //     ),
            //     Icon(Icons.search),
            //   ],
            // )
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    child: TextField(
                      controller: textSearchController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Search ....',
                      ),
                    ),
                  ),
                ),
                InkWell(
                  child: Icon(
                    Icons.search,
                    size: 40,
                  ),
                  onTap: () {
                    var searchStr = textSearchController.text;
                    controller.searchItems(searchStr);
                  },
                )
              ],
            ),
            // Expanded(
            //   child: ListView(
            //     children: [
            //       ListItem(),
            //       ListItem(),
            //       ListItem(),
            //       ListItem(),
            //       ListItem(),
            //       ListItem(),
            //       ListItem(),
            //       ListItem(),
            //       ListItem(),
            //     ],
            //   ),
            // )
            Expanded(
              child: GetX<NotesListController>(
                initState: (state) {
                  Get.find<NotesListController>().getAll();
                },
                builder: (noteListController) {
                  print('> builder : ${noteListController.notesList.length}');
                  return noteListController.notesList.length < 1
                      // ? LoadWidget()
                      ? Container()
                      : ListView.separated(
                          itemBuilder: (context, index) {
                            return Dismissible(
                              key: UniqueKey(),
                              onDismissed: (_) {
                                noteListController.removeItem(
                                    noteListController.notesList[index]);
                                // noteListController.notesList.removeAt[index];
                              },
                              child: ListTile(
                                title: Text(
                                    noteListController.notesList[index].title ??
                                        'a'),
                                subtitle: Text(
                                    noteListController.notesList[index].body ??
                                        'b'),
                                // onTap: () => _.details(_.postList[index]),
                                onTap: () {},
                              ),
                            );
                          },
                          itemCount: noteListController.notesList.length,
                          separatorBuilder: (_, __) => Divider(),
                        );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
