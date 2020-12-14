import 'package:http/http.dart' as http;
import 'package:le_savoir_du_nord/components/Absence.dart';
import 'package:le_savoir_du_nord/components/Note.dart';
import 'package:le_savoir_du_nord/components/Class.dart';

String urlAbsence =
    'http://lesavoirdunord.herokuapp.com/api/attendancesByStudent/';
String urlClass = 'http://lesavoirdunord.herokuapp.com/api/classesByStudent/';
String urlNote = 'http://lesavoirdunord.herokuapp.com/api/gradesByStudent/';

Future<Absence> getApiAbsence(String url) async {
  try {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      if (response.body.length > 2) {
        return Absence().JsonClass(response.body);
      }
      return Absence.empty();
    }
    return Absence.empty();
  } catch (e) {
    return Absence.empty();
  }
}

Future<Note> getApiNote(String url) async {
  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      if (response.body.length > 2) {
        return Note().JsonClass(response.body);
      }
      return Note.empty();
    }

    return Note.empty();
  } catch (e) {
    return Note.empty();
  }
}

Future<Class> getApiClass(String url) async {
  var response = await http.get(url);

  if (response.statusCode == 200) {
    if (response.body.length > 2) {
      return Class().JsonClass(response.body);
    }
    return Class.empty();
  }
  return Class.empty();
}
