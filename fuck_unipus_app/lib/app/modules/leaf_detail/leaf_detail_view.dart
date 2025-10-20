import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/app_error_view.dart';
import 'leaf_detail_controller.dart';

class LeafDetailView extends GetView<LeafDetailController> {
  const LeafDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(controller.breadcrumb()),
          actions: [
            Obx(
              () => IconButton(
                onPressed:
                    controller.isLoading.value ? null : () => controller.load(),
                icon: const Icon(Icons.refresh),
                tooltip: '重新获取',
              ),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: '内容'),
              Tab(text: '总结'),
              Tab(text: '题目'),
            ],
          ),
        ),
        body: Obx(() {
          final isLoading = controller.isLoading.value;
          final error = controller.errorMessage.value;

          if (isLoading) {
            return const TabBarView(
              children: [
                Center(child: CircularProgressIndicator()),
                Center(child: CircularProgressIndicator()),
                Center(child: CircularProgressIndicator()),
              ],
            );
          }

          if (error != null) {
            return TabBarView(
              children: [
                AppErrorView(message: error, onRetry: () => controller.load()),
                AppErrorView(message: error, onRetry: () => controller.load()),
                AppErrorView(message: error, onRetry: () => controller.load()),
              ],
            );
          }

          return TabBarView(
            children: [
              _JsonSection(
                data: controller.content.value,
                emptyLabel: '暂无内容',
              ),
              _JsonSection(
                data: controller.summary.value,
                emptyLabel: '暂无总结',
              ),
              _JsonSection(
                data: controller.questions.value,
                emptyLabel: '暂无题目',
              ),
            ],
          );
        }),
      ),
    );
  }
}

class _JsonSection extends StatelessWidget {
  const _JsonSection({
    required this.data,
    required this.emptyLabel,
  });

  final dynamic data;
  final String emptyLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final content = _formatData(data, emptyLabel);

    return Scrollbar(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: SelectableText(
          content,
          style: theme.textTheme.bodyMedium?.copyWith(fontFamily: 'monospace'),
        ),
      ),
    );
  }

  String _formatData(dynamic value, String fallback) {
    if (value == null) {
      return fallback;
    }

    try {
      return const JsonEncoder.withIndent('  ').convert(value);
    } catch (_) {
      return value.toString();
    }
  }
}
