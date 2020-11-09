import 'package:http/http.dart' as http;
import 'package:le_savoir_du_nord/components/Absence.dart';
import 'package:le_savoir_du_nord/constants.dart';
import 'package:le_savoir_du_nord/components/Note.dart';

String urlAbsence =
    'http://lesavoirdunord.herokuapp.com/api/attendancesByStudent/${studentID}/${registerID}';
String urlClass =
    'http://http://lesavoirdunord.herokuapp.com/api/classesByStudent/${studentID}/${registerID}';
String urlNote =
    'http://lesavoirdunord.herokuapp.com/api/gradesByStudent/${studentID}/${registerID}';

Future<Absence> getApiAbsence(String url, Absence instance) async {
  var response = await http.get(url);

  if (response.statusCode == 200) {
    String formats = response.body;
    return Absence().JsonClass(formats.substring(1, response.body.length - 1));
  }
  return null;
}

Future<Note> getApiNote(String url, Note instance) async {
  var response = await http.get(url);

  if (response.statusCode == 200) {
    String formats = response.body;
    return Note().JsonClass(formats.substring(1, response.body.length - 1));
  }
  return null;
}
