import 'dart:convert' as json;

class Note {
  List<List<String>> values;
  static const index = <String>[
    "Stu_first_name",
    "test_1",
    "test_2",
    "participation",
    "final_exam",
    "total",
    "decision",
    "teacher_remarks",
    "cl_name",
    "url",
    "Stu_last_name",
    "t_last_name",
    "t_first_name",
    "c_term",
    "lan",
    "lvl",
    "cat"
  ];
  Note({this.values});

  factory Note.fromJson(Map<String, dynamic> json) {
    if (json == null) return Note.empty();

    List<List<String>> helper = List<List<String>>(json.length);
    for (int j = 0; j < json.length; j++)
      for (int i = 0; i < 17; i++) helper[0].add(json[index[i]].toString());
    return Note(values: helper);
  }

  factory Note.empty() {
    List<List<String>> helper = List<List<String>>(1);
    helper[0] = List.filled(17, "none");
    return Note(values: helper);
  }

  @override
  Note JsonClass(String jsonStr) {
    final decode = json.jsonDecode(jsonStr);
    Note listJson = Note.fromJson(decode);
    return listJson;
  }
}
