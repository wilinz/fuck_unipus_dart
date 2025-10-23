import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:fuck_unipus/fuck_unipus.dart';

import '../../data/unipus_service.dart';
import '../../routes/app_routes.dart';
import '../../services/storage.dart';

class LoginController extends GetxController {
  LoginController() : _service = Get.find<UnipusService>();

  final UnipusService _service;
  final GetStorage _storage = getStorage;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final RxBool isLoading = false.obs;
  final RxnString errorMessage = RxnString();
  final RxBool rememberPassword = false.obs;
  final RxBool showPassword = false.obs;

  Map<String, String> _savedCredentials = {};

  @override
  void onInit() {
    super.onInit();
    final stored = _storage.read<Map<String, dynamic>>(GetStorageKeys.credentials);
    if (stored != null) {
      _savedCredentials = stored.map(
        (key, value) => MapEntry(key.toString(), value.toString()),
      );
    }

    if (_savedCredentials.isNotEmpty) {
      final firstUsername = _savedCredentials.keys.first;
      usernameController.text = firstUsername;
      _applySavedPassword(firstUsername);
    }

    usernameController.addListener(_handleUsernameChange);
  }

  void _handleUsernameChange() {
    clearError();
    final username = usernameController.text.trim();
    if (username.isEmpty) {
      rememberPassword.value = false;
      return;
    }
    final saved = _savedCredentials[username];
    if (saved != null && passwordController.text != saved) {
      passwordController.text = saved;
      rememberPassword.value = true;
    } else if (saved == null) {
      rememberPassword.value = false;
    }
  }

  void clearError() {
    errorMessage.value = null;
  }

  void togglePasswordVisibility() {
    showPassword.toggle();
  }

  void toggleRememberPassword(bool? value) {
    clearError();
    rememberPassword.value = value ?? false;
    if (!rememberPassword.value) {
      final username = usernameController.text.trim();
      if (_savedCredentials.remove(username) != null) {
        _persistCredentials();
      }
    }
  }

  Future<void> submit() async {
    final username = usernameController.text.trim();
    var password = passwordController.text;

    if (username.isEmpty) {
      errorMessage.value = '请输入用户名';
      return;
    }

    isLoading.value = true;
    errorMessage.value = null;

    try {
      final loggedIn = await _service.prepareClient(username);
      String? effectivePassword;

      if (!loggedIn) {
        if (password.isEmpty) {
          final saved = _savedCredentials[username];
          if (saved != null) {
            password = saved;
            passwordController.text = saved;
            rememberPassword.value = true;
          } else {
            errorMessage.value = '首次登录需要输入密码';
            return;
          }
        }
        effectivePassword = password;
        await _service.login(
          password: effectivePassword,
          captchaHandler: _handleCaptcha,
        );
      } else {
        effectivePassword =
            password.isNotEmpty ? password : _savedCredentials[username];
      }

      if (rememberPassword.value && (effectivePassword?.isNotEmpty ?? false)) {
        _savedCredentials[username] = effectivePassword!;
        _persistCredentials();
      } else if (!rememberPassword.value &&
          _savedCredentials.containsKey(username)) {
        _savedCredentials.remove(username);
        _persistCredentials();
      }

      Get.offAllNamed(AppRoutes.courses);
    } catch (e) {
      errorMessage.value = _formatError(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<String> _handleCaptcha(CaptchaResponse response) async {
    final imageData = response.rs.image;
    final base64Part = imageData.contains(',')
        ? imageData.split(',').last
        : imageData;
    late Uint8List bytes;
    try {
      bytes = base64Decode(base64Part);
    } catch (_) {
      throw Exception('验证码解析失败');
    }

    final inputController = TextEditingController();
    String? captchaError;

    final result = await Get.dialog<String>(
      StatefulBuilder(
        builder: (context, setState) {
          void submit() {
            final value = inputController.text.trim();
            if (value.isEmpty) {
              setState(() {
                captchaError = '请输入验证码';
              });
              return;
            }
            Get.back(result: value);
          }

          return AlertDialog(
            title: const Text('请输入验证码'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.memory(
                    bytes,
                    width: 220,
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: inputController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    labelText: '验证码',
                    hintText: '输入图片中的字符',
                  ),
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => submit(),
                ),
                if (captchaError != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    captchaError!,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ],
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Get.back(),
                child: const Text('取消'),
              ),
              TextButton(
                onPressed: submit,
                child: const Text('确定'),
              ),
            ],
          );
        },
      ),
      barrierDismissible: false,
    );

    inputController.dispose();

    if (result == null) {
      throw Exception('已取消验证码输入');
    }

    return result.trim();
  }

  String _formatError(Object error) {
    final text = error.toString();
    final separatorIndex = text.indexOf(': ');
    if (separatorIndex != -1) {
      return text.substring(separatorIndex + 2).trim();
    }
    return text;
  }

  void _applySavedPassword(String username) {
    final saved = _savedCredentials[username];
    if (saved != null) {
      passwordController.text = saved;
      rememberPassword.value = true;
    } else {
      rememberPassword.value = false;
    }
  }

  void _persistCredentials() {
    _storage.write(GetStorageKeys.credentials, Map<String, String>.from(_savedCredentials));
  }

  @override
  void onClose() {
    usernameController.removeListener(_handleUsernameChange);
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
