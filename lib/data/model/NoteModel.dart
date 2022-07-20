final String tableNotes = 'Notes';
final String columnId = 'id';
final String columnTitle = 'title';
final String columnDescription = 'description';

class NoteModel {
  int id = 0;
  late String title;
  late String body;

  NoteModel({this.id = 0, this.title = '', this.body = ''});

  NoteModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.title = json['title'];
    this.body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }

  Map<String, Object?> toMap() {
    var map = <String, Object?>{columnTitle: title, columnDescription: body};
    if (id != null && id != 0) {
      map[columnId] = id;
    }
    return map;
  }

  NoteModel.fromMap(Map<String, Object?> map) {
    id = map[columnId] as int;
    title = map[columnTitle] as String;
    body = map[columnDescription] as String;
  }
}
