import 'dart:typed_data';
import 'dart:convert';
import 'package:pointycastle/pointycastle.dart';

main(List<String> arguments) {

  Digest digest = new Digest("SHA-256");

  String value = "Hello World";

  Uint8List data = new Uint8List.fromList(new Utf8Encoder().convert(value));
  Uint8List hash = digest.process(data);

  print(hash);
  print(base64.encode(hash));
}