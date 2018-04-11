import 'dart:async';

int count = 0;

main(List<String> arguments) {

  Duration duration = new Duration(seconds: 1);
  Timer timer = new Timer.periodic(duration, timeout);
  print("Starded ${getTime()}");
}

void timeout(Timer timer) {
  print("Timeout: ${getTime()}");

  count++;
  if (count >= 5) timer.cancel();
}

String getTime() {
  DateTime dt = new DateTime.now();
  return dt.toString();
}