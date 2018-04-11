import 'dart:io';
import 'dart:async';

main(List<String> arguments) async {

  print('Starting');

  File file = await appendFile();

  print('Appended to file ${file.path}');

  print('***** The End');
}

Future<File> appendFile() {

  File file = new File(Directory.current.path + '/test2.txt');
  DateTime now = new DateTime.now();
  return file.writeAsString(now.toString() + '\r\n', mode: FileMode.APPEND);
}