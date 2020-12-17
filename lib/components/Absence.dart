import 'dart:convert' as json;

class Absence {
  List<List<dynamic>> values;
  static int actuelPage = 0;
  static int maxPage;
  static const index = <String>[
    "class_id",
    "stu_id",
    "cl_name",
    "url",
    "Stu_last_name",
    "c_term",
    "lan",
    "lvl",
    "attendances"
  ];

  Absence({this.values});

  factory Absence.fromJson(List<dynamic> json) {
    if (json == null) return Absence.empty();

    List<List<dynamic>> helper = List<List<dynamic>>();
    maxPage = json.length;
    for (int j = 0; j < maxPage; j++) {
      List<dynamic> miniHelper = List<dynamic>();
      for (int i = 0; i < 9; i++) miniHelper.add(json[j][index[i]].toString());
      helper.add(miniHelper);
    }
    return Absence(values: helper);
  }
  factory Absence.empty() {
    List<List<dynamic>> helper = List<List<dynamic>>(1);
    helper[0] = List.filled(9, "vide");
    Absence.maxPage = 1;
    return Absence(values: helper);
  }

  @override
  Absence JsonClass(String jsonStr) {
    final decode = json.jsonDecode(jsonStr);
    Absence listJson = Absence.fromJson(decode);
    return listJson;
  }
}
