

class history{
String id;
String user_id;
String field;
String title;
String description;
String attached_file;
String file_type;
String date;
String type;

history({
    required this.id,
    required this.user_id,
    required this.field,
    required this.title,
    required this.description,
    required this.attached_file,
    required this.file_type,
    required this.date,
    required this.type,
  });

Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'user_id': this.user_id,
      'field': this.field,
      'title': this.title,
      'description': this.description,
      'attached_file': this.attached_file,
      'file_type': this.file_type,
      'date': this.date,
      'type': this.type,
    };
  }

  factory history.fromMap(Map<String, dynamic> map) {
    return history(
      id: map['id'] as String,
      user_id: map['user_id'] as String,
      field: map['field'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      attached_file: map['attached_file'] as String,
      file_type: map['file_type'] as String,
      date: map['date'] as String,
      type: map['type'] as String,
    );
  }
}