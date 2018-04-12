import 'package:http/http.dart' as http ;
import 'dart:async';

main(List<String> arguments) async {

  var url = 'http://httpbin.org';
  var response = await http.get(url);
  print('Response status ${response.statusCode}');
  print('Response body ${response.body}');
}
