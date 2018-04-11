import 'dart:io';
import 'dart:convert';

main(List<String> arguments) {

  int zlib = testCompress(ZLIB);
  int gzip = testCompress(GZIP);

  print('zlib = ${zlib}');
  print('gzip = ${gzip}');
}

String generateData() {

  String data = '';
  for(int i = 0; i < 1000; i++){
    data = data + 'Hello World\r\n';
  }
  return data;
}

int testCompress (var codec) {

  String data = generateData();

  //Original data
  List original = new Utf8Codec().encode(data);

  //Compress data
  List compressed = codec.encode(original);

  //Decompress data
  List decompress = codec.decode(compressed);

  print('Testing ${codec.toString()}');
  print('Original ${original.length} bytes');
  print('Compressed ${compressed.length} bytes');
  print('Decompressed ${decompress.length} bytes');

  print('');

  String decoded = new Utf8Codec().decode(decompress);

  assert(data == decoded);

  return compressed.length;
}