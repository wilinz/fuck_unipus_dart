import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/unipus_service.dart';
import '../../routes/app_routes.dart';

class LoginController extends GetxController {
  LoginController() : _service = Get.find<UnipusService>();

  final UnipusService _service;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final RxBool isLoading = false.obs;
  final RxnString errorMessage = RxnString();

  void clearError() {
    errorMessage.value = null;
  }

  Future<void> submit() async {
    final username = usernameController.text.trim();
    final password = passwordController.text;

    if (username.isEmpty) {
      errorMessage.value = '请输入用户名';
      return;
    }

    isLoading.value = true;
    errorMessage.value = null;

    try {
      final loggedIn = await _service.prepareClient(username);
      if (!loggedIn) {
        if (password.isEmpty) {
          errorMessage.value = '首次登录需要输入密码';
          return;
        }
        await _service.login(password: password);
      }
      Get.offAllNamed(AppRoutes.courses);
    } catch (e) {
      errorMessage.value = _formatError(e);
    } finally {
      isLoading.value = false;
    }
  }

  String _formatError(Object error) {
    final text = error.toString();
    final separatorIndex = text.indexOf(': ');
    if (separatorIndex != -1) {
      return text.substring(separatorIndex + 2).trim();
    }
    return text;
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
