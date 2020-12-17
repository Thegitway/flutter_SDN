import 'dart:convert' as json;

class Note {
  List<List<dynamic>> values;
  static int actuelPage = 0;
  static int maxPage;
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

  factory Note.fromJson(List<dynamic> json) {
    if (json == null) {
      return Note.empty();
    }

    List<List<dynamic>> helper = List<List<dynamic>>();
    maxPage = json.length;
    for (int j = 0; j < maxPage; j++) {
      List<dynamic> miniHelper = List<dynamic>();
      for (int i = 0; i < 17; i++) {
        miniHelper.add(json[j][index[i]].toString());
      }
      helper.add(miniHelper);
    }
    return Note(values: helper);
  }

  factory Note.empty() {
    List<List<dynamic>> helper = List<List<dynamic>>(1);
    helper[0] = List.filled(17, "none");
    Note.maxPage = -1;
    return Note(values: helper);
  }

  @override
  Note JsonClass(String jsonStr) {
    final decode = json.jsonDecode(jsonStr);
    Note listJson = Note.fromJson(decode);
    return listJson;
  }
}
