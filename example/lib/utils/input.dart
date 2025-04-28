import 'dart:io';

String input(String prompt) {
  stdout.write(prompt);
  String? input = stdin.readLineSync();
  return input?.trim() ?? '';
}

String inputTrim(String prompt) {
  return input(prompt).trim();
}

String inputPassword(String prompt) {
  stdout.write(prompt);
  stdin.echoMode = false;
  final read = stdin.readLineSync() ?? '';
  stdin.echoMode = true;
  return read;
}

String inputPasswordTrim(String prompt) {
  return inputPassword(prompt).trim();
}