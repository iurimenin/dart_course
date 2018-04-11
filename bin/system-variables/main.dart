import 'dart:io';

main(List<String> arguments) {

  // Inicial
  print("OS: ${Platform.operatingSystem} ${Platform.version}");

  if (Platform.isWindows) {
    print("Run windows code");
  } else if (Platform.isAndroid) {
    print("Run android code");
  } else if (Platform.isIOS) {
    print("Run ios code");
  } else if (Platform.isMacOS) {
    print("Run macOS code");
  }

  print("Path: ${Platform.script.path}");
  print("dart: ${Platform.executable}");
  
  print("Env:");
  Platform.environment.keys.forEach((key) {
    print("${key} ${Platform.environment[key]}");
  });
}
