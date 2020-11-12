import 'dart:convert' as json;

class Class {
  List<String> values;
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

  factory Class.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      List<String> helper = List.filled(8, "none");
      return Class(values: helper);
    }
    List<String> helper = List<String>();
    for (int i = 0; i < 8; i++) helper.add(json[index[i]].toString());
    return Class(values: helper);
  }

  factory Class.empty() {
    List<String> helper = List.filled(8, "none");
    return Class(values: helper);
  }

  @override
  Class JsonClass(String jsonStr) {
    final decode = json.jsonDecode(jsonStr);
    Class listJson = Class.fromJson(decode);
    return listJson;
  }
}
