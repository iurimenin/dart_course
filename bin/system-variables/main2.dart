import 'dart:io';

main(List<String> arguments) {

  // List all files in a directory - unix
  Process.run('ls', ['-l']).then((ProcessResult results) {
    print(results.stdout);
    print("Exit code: ${results.exitCode}"); // o is good
  });
}