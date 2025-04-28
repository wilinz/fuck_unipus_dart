import 'dart:io';

import 'package:dcli/dcli.dart';
import 'package:example/utils/input.dart';
import 'package:fuck_unipus/fuck_unipus.dart';

void main() async {
  final cookieDir = "./cookies";
  final username = inputTrim("请输入用户名：");

  final unipus = await Unipus.newInstance(cookieDir: cookieDir, cookieSubDir: username);
  final isLogin = await unipus.checkLoginAndSetupSession();
  if (!isLogin) {
    final password = inputTrim("请输入密码：");
    await unipus.login(
      username: username,
      password: password,
      service: Unipus.unipusService,
      captchaHandler: (captchaResponse) async {
        throw "";
      },
    );
  }

  final courses = await unipus.getCourses();
  print(courses);
}
