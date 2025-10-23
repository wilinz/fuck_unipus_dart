import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
                      labelText: controller.rememberPassword.value
                          ? '密码 (已保存)'
                          : '密码',
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        tooltip: controller.showPassword.value
                            ? '隐藏密码'
                            : '显示密码',
                        icon: Icon(
                          controller.showPassword.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                        onPressed: controller.togglePasswordVisibility,
                      ),
                    ),
                    obscureText: !controller.showPassword.value,
                    onChanged: (_) => controller.clearError(),
                  ),
                ),
                const SizedBox(height: 12),
                Obx(() {
                  final remember = controller.rememberPassword.value;
                  final show = controller.showPassword.value;
                  final loading = controller.isLoading.value;
                  return Row(
                    children: [
                      Checkbox(
                        value: remember,
                        onChanged:
                            loading ? null : controller.toggleRememberPassword,
                      ),
                      const Text('保存账号密码'),
                      const Spacer(),
                      TextButton(
                        onPressed: controller.togglePasswordVisibility,
                        child: Text(show ? '隐藏密码' : '显示密码'),
                      ),
                    ],
                  );
                }),
                const SizedBox(height: 12),
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
                          color: theme.colorScheme.error,
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
                  '提示：若保存密码，下次会自动填写。',
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
