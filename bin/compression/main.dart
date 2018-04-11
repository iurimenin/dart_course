import 'dart:io';
import 'dart:convert';

main(List<String> arguments) {

  String data = '';
  for(int i = 0; i < 100; i++){
    data = data + 'Hello World\r\n';
  }

  //Original data
  List original = new Utf8Codec().encode(data);

  //Compress data
  List compressed = GZIP.encode(original);

  //Decompress data
  List decompress = GZIP.decode(compressed);

  print('Original ${original.length} bytes');
  print('Compressed ${compressed.length} bytes');
  print('Decompressed ${decompress.length} bytes');

  String decoded = new Utf8Codec().decode(decompress);

  assert(data == decoded);

  print(decoded);
}