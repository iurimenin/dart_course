import 'dart:io';
import 'dart:convert';

main(List<String> arguments) async {

  var data = 'Hello World';

  List<int> dataToSend = new Utf8Encoder().convert(data);
  int port = 3000;

  //Server
  RawDatagramSocket.bind(InternetAddress.LOOPBACK_IP_V4, port).then((RawDatagramSocket udpSocket) {
    udpSocket.listen((RawSocketEvent event) {
      if (event == RawSocketEvent.READ) {
        Datagram dg = udpSocket.receive();
        print(new Utf8Decoder().convert(dg.data));
      }
    });

    //Client
    udpSocket.send(dataToSend, InternetAddress.LOOPBACK_IP_V4, port);
    print('Sent!');
  });
}
