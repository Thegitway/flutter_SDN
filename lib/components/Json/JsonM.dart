import 'package:http/http.dart' as http;
import 'package:le_savoir_du_nord/components/Absence.dart';
import 'package:le_savoir_du_nord/constants.dart';
import 'package:le_savoir_du_nord/components/Note.dart';
import 'package:le_savoir_du_nord/components/Class.dart';

String urlAbsence =
    'http://lesavoirdunord.herokuapp.com/api/attendancesByStudent/';
String urlClass = 'http://lesavoirdunord.herokuapp.com/api/classesByStudent/';
String urlNote = 'http://lesavoirdunord.herokuapp.com/api/gradesByStudent/';

Future<Absence> getApiAbsence(String url) async {
  var response = await http.get(url);

  if (response.statusCode == 200) {
    if (response.body.length > 2) {
      String formats = response.body;
      return Absence()
          .JsonClass(formats.substring(1, response.body.length - 1));
    }
    return Absence.empty();
  }
  return Absence.empty();
}

Future<Note> getApiNote(String url) async {
  var response = await http.get(url);
  if (response.statusCode == 200) {
    if (response.body.length > 2) {
      String formats = response.body;
      return Note().JsonClass(formats.substring(1, response.body.length - 1));
    }
    return Note.empty();
  }

  return Note.empty();
}

Future<Class> getApiClass(String url) async {
  var response = await http.get(url);

  if (response.statusCode == 200) {
    if (response.body.length > 2) {
      String formats = response.body;
      return Class().JsonClass(formats.substring(1, response.body.length - 1));
    }
    return Class.empty();
  }
  return Class.empty();
}
