import 'dart:io';
import 'dart:convert';

main(List<String> arguments) async {
  
  var socket = await Socket.connect('127.0.0.1', 3000);
  print('Conneceted');
  
  socket.writeln("Hello World");
  print('Sent, closing');
  await socket.close();
  print("Closed");
  exit(0);
}