import 'dart:io';
import 'dart:convert';

main(List<String> arguments) {

  // unix specific
  Process.start("cat", []).then((Process process) {

    //transform the output
    process.stdout.transform(new Utf8Decoder()).listen((data){
      print(data);
    });

    //Send to the process
    process.stdin.writeln("Hello World");

    //Stop the process
    Process.killPid(process.pid);

    //get the exit code
    process.exitCode.then((int code) {

      print("Exit code: ${code}");

      //exit
      exit(0);
    });
  });
}