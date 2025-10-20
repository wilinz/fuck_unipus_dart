import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/app_error_view.dart';
import '../../widgets/course_unit_tree.dart';
import 'course_detail_controller.dart';

class CourseDetailView extends GetView<CourseDetailController> {
  const CourseDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = controller.args;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(args.courseName),
            Text(
              args.className,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        actions: [
          Obx(
            () => IconButton(
              onPressed:
                  controller.isLoading.value ? null : () => controller.load(),
              icon: const Icon(Icons.refresh),
              tooltip: '刷新',
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          _CourseHeader(status: args.status),
          const Divider(height: 1),
          Expanded(
            child: Obx(() {
              final error = controller.errorMessage.value;
              final isLoading = controller.isLoading.value;
              final nodes = controller.nodes;

              if (nodes.isEmpty && isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (nodes.isEmpty && error != null) {
                return AppErrorView(
                  message: error,
                  onRetry: () => controller.load(),
                );
              }

              return RefreshIndicator(
                onRefresh: controller.load,
                child: CourseUnitTree(
                  nodes: nodes.toList(),
                  onLeafTap: controller.openLeaf,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _CourseHeader extends StatelessWidget {
  const _CourseHeader({required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      color: theme.colorScheme.surfaceVariant.withOpacity(0.3),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 12,
        runSpacing: 8,
        children: [
          Chip(
            label: Text(status.isEmpty ? '未知状态' : status),
            avatar: const Icon(Icons.info_outline, size: 18),
          ),
          const Text('点击必修节点以查看内容和题目'),
        ],
      ),
    );
  }
}
