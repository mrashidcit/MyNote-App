import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/data/model/NoteModel.dart';
import 'package:note_app/modules/add_note/add_note_controller.dart';

class AddNotePage extends StatefulWidget {
  AddNotePage({Key? key}) : super(key: key);

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final textTitleController = TextEditingController();
  final textDescriptionController = TextEditingController();
  final AddNoteController controller = Get.find();

  @override
  void dispose() {
    // TODO: implement dispose
    textTitleController.dispose();
    textDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller: textTitleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Title',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              child: TextFormField(
                controller: textDescriptionController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter description',
                ),
                maxLines: 6,
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.top,
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      ElevatedButton(onPressed: () {}, child: Text('Cancel')),
                )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        print('> title : ' + textTitleController.text);
                        print('> desc : ' + textDescriptionController.text);
                        var noteModel = new NoteModel(
                            title: textTitleController.text,
                            body: textDescriptionController.text);

                        controller.insertNote(noteModel);
                      },
                      child: Text('Save')),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
