import 'dart:convert';
import 'dart:typed_data';
import 'package:collection/collection.dart';
import 'package:pointycastle/pointycastle.dart';
import 'main2.dart';
import 'main3.dart';

main(List<String> arguments) {

  final key = randomBytes(16);
  final params = new KeyParameter(key);

  BlockCipher cipher = new BlockCipher("AES");
  cipher.init(true, params);

  //Encrypt
  String plaintext = 'Hello world';
  Uint8List plainData = createUint8ListFromString(plaintext.padRight(cipher.blockSize)); //PAD - NOT 100% secure
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