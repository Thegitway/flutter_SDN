import 'package:http/http.dart' as http;
import 'package:le_savoir_du_nord/components/Absence.dart';

Future<Absence> ClassApi() async {
  var url =
      'http://lesavoirdunord.herokuapp.com/api/attendancesByStudent/4019167/1711820';
  var response = await http.get(url);
  if (response.statusCode == 200) {
    String formats = response.body;
    return JsonClass(formats.substring(1, response.body.length - 1));
  }
  return null;
}
