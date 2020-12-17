import 'dart:convert' as json;

class Class {
  List<List<dynamic>> values;
  static int actuelPage = 0;
  static int maxPage;
  static const index = <String>[
    "class_id",
    "stu_id",
    "cl_name",
    "url",
    "stu_last_name",
    "c_term",
    "lan",
    "lvl",
  ];
  Class({this.values});

  factory Class.fromJson(List<dynamic> json) {
    if (json == null) {
      return Class.empty();
    }
    List<List<dynamic>> helper = List<List<dynamic>>();
    maxPage = json.length;
    for (int j = 0; j < json.length; j++) {
      List<dynamic> miniHelper = List<dynamic>();
      for (int i = 0; i < 8; i++) miniHelper.add(json[j][index[i]].toString());
      helper.add(miniHelper);
    }
    return Class(values: helper);
  }

  factory Class.empty() {
    List<List<dynamic>> helper = List<List<dynamic>>(1);
    helper[0] = List.filled(8, "none");
    Class.maxPage = -1;
    return Class(values: helper);
  }

  @override
  Class JsonClass(String jsonStr) {
    final decode = json.jsonDecode(jsonStr);
    Class listJson = Class.fromJson(decode);
    return listJson;
  }
}
