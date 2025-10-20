import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('登录 Unipus')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: controller.usernameController,
                  decoration: const InputDecoration(
                    labelText: '用户名',
                    hintText: '学号或手机号',
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                  textInputAction: TextInputAction.next,
                  onChanged: (_) => controller.clearError(),
                ),
                const SizedBox(height: 16),
                Obx(
                  () => TextField(
                    controller: controller.passwordController,
                    decoration: InputDecoration(
                      labelText: controller.isLoading.value
                          ? '密码 (如需重新登录)'
                          : '密码 (首次登录时必填)',
                      prefixIcon: const Icon(Icons.lock_outline),
                    ),
                    obscureText: true,
                    onChanged: (_) => controller.clearError(),
                  ),
                ),
                const SizedBox(height: 24),
                Obx(
                  () {
                    final error = controller.errorMessage.value;
                    if (error == null) {
                      return const SizedBox.shrink();
                    }
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Text(
                        error,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    );
                  },
                ),
                Obx(
                  () => ElevatedButton.icon(
                    onPressed:
                        controller.isLoading.value ? null : controller.submit,
                    icon: controller.isLoading.value
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.login),
                    label: Text(
                      controller.isLoading.value ? '请稍候' : '进入课程',
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  '提示：若该设备已登录过，会自动复用缓存 Cookies。',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
