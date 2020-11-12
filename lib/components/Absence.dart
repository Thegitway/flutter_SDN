import 'dart:convert' as json;

class Absence {
  String class_id;
  String stu_id;
  String cl_name;
  String url;
  String Stu_last_name;
  String c_term;
  String lan;
  String lvl;
  String attendances;

  Absence(
      {this.class_id,
      this.stu_id,
      this.cl_name,
      this.url,
      this.Stu_last_name,
      this.c_term,
      this.lan,
      this.lvl,
      this.attendances});

  factory Absence.fromJson(Map<String, dynamic> json) {
    if (json == null) return Absence.empty();
    return Absence(
        class_id: json['class_id'],
        stu_id: json['stu_id'],
        cl_name: json['cl_name'],
        url: json['url'],
        Stu_last_name: json['Stu_last_name'],
        c_term: json['c_term'],
        lan: json['lan'],
        lvl: json['lvl'],
        attendances: json['attendances']);
  }
  factory Absence.empty() {
    return Absence(
        class_id: "none",
        stu_id: "none",
        cl_name: "none",
        url: "none",
        Stu_last_name: "none",
        c_term: "none",
        lan: "none",
        lvl: "none",
        attendances: "0");
  }

  @override
  Absence JsonClass(String jsonStr) {
    final decode = json.jsonDecode(jsonStr);
    Absence listJson = Absence.fromJson(decode);
    return listJson;
  }
}
