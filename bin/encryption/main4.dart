import 'dart:convert';
import 'dart:typed_data';
import 'package:collection/collection.dart';
import 'package:pointycastle/pointycastle.dart';
import 'main2.dart';
import 'main3.dart';

main(List<String> arguments) {

  final keybytes = randomBytes(16);
  final key = new KeyParameter(keybytes);
  final iv = randomBytes(8);
  final params = new ParametersWithIV(key, iv);

  StreamCipher cipher = new StreamCipher('Salsa20');
  cipher.init(true, params);

  String plaintext = 'Hello world';
  Uint8List plainData = createUint8ListFromString(plaintext);
  Uint8List encryptedData = cipher.process(plainData);

  //Decrypt
  cipher.reset();
  cipher.init(false, params);
  Uint8List decyptedData = cipher.process(encryptedData);

  display('Plain text', plainData);
  display('Encrypted Data', encryptedData);
  display('Dencrypted Data', decyptedData);

  //Make sure the match!
  Function eq = const ListEquality().equals;
  assert(eq(plainData, decyptedData));

  print(new Utf8Decoder().convert(decyptedData));
}