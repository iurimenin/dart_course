import 'package:http/http.dart' as http;
import 'dart:async';

main(List<String> arguments) async {

  var url = 'http://httpbin.org/post';
  var response = await http.post(url, body: 'name=Iuri&color=Blue');
  print('Response status ${response.statusCode}');
  print('Response body ${response.body}');
}
