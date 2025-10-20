import 'package:flutter/material.dart';
import 'package:characters/characters.dart';
import 'package:get/get.dart';

import 'package:fuck_unipus/fuck_unipus.dart';

import '../../widgets/app_error_view.dart';
import 'course_list_controller.dart';

class CourseListView extends GetView<CourseListController> {
  const CourseListView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      body: SafeArea(
        child: Obx(
          () {
            final session = controller.sessionInfo.value;
            final classes = controller.classes.toList();
            final isLoading = controller.isLoading.value;
            final error = controller.errorMessage.value;

            Widget buildContent() {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _SideNavigation(
                      theme: theme,
                      session: session,
                      onRefresh: controller.loadCourses,
                      isLoading: isLoading,
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _TopBar(
                            session: session,
                            onRefresh: controller.loadCourses,
                            isLoading: isLoading,
                          ),
                          const SizedBox(height: 16),
                          Expanded(
                            child: Stack(
                              children: [
                                RefreshIndicator(
                                  onRefresh: controller.loadCourses,
                                  color: theme.colorScheme.primary,
                                  child: ListView(
                                    physics: const AlwaysScrollableScrollPhysics(),
                                    padding: const EdgeInsets.only(bottom: 32),
                                    children: [
                                      if (error != null && classes.isNotEmpty)
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 16),
                                          child: AppErrorView(
                                            message: error,
                                            onRetry: () => controller.loadCourses(),
                                          ),
                                        ),
                                      if (classes.isEmpty && !isLoading)
                                        Container(
                                          height: 220,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(16),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(0.05),
                                                blurRadius: 12,
                                                offset: const Offset(0, 6),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Icons.menu_book_outlined,
                                                size: 48,
                                                color: theme.colorScheme.primary,
                                              ),
                                              const SizedBox(height: 12),
                                              const Text(
                                                '暂无校内课程',
                                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                              ),
                                              const SizedBox(height: 8),
                                              const Text('尝试刷新或联系管理员同步班课信息'),
                                            ],
                                          ),
                                        ),
                                      for (final classBlock in classes)
                                        _ClassSection(
                                          classBlock: classBlock,
                                          onCourseTap: controller.openCourse,
                                        ),
                                    ],
                                  ),
                                ),
                                if (isLoading && classes.isNotEmpty)
                                  const Positioned(
                                    top: 0,
                                    left: 0,
                                    right: 0,
                                    child: LinearProgressIndicator(minHeight: 3),
                                  ),
                                if (isLoading && classes.isEmpty)
                                  const Center(child: CircularProgressIndicator()),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }

            if (classes.isEmpty && !isLoading && error != null) {
              return Center(
                child: SizedBox(
                  width: 420,
                  child: AppErrorView(
                    message: error,
                    onRetry: () => controller.loadCourses(),
                  ),
                ),
              );
            }

            return buildContent();
          },
        ),
      ),
    );
  }
}

class _SideNavigation extends StatelessWidget {
  const _SideNavigation({
    required this.theme,
    required this.session,
    required this.onRefresh,
    required this.isLoading,
  });

  final ThemeData theme;
  final UnipusSessionInfo? session;
  final Future<void> Function() onRefresh;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final displayName = session?.name.trim();
    return Container(
      width: 240,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 18,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CircleAvatar(
            radius: 38,
            backgroundColor: theme.colorScheme.primary.withOpacity(0.15),
            child: Text(
              (displayName?.isNotEmpty == true
                      ? displayName!.characters.first
                      : 'U')
                  .toUpperCase(),
              style: TextStyle(
                fontSize: 28,
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            displayName?.isNotEmpty == true ? displayName! : '未登录用户',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            'Welcome',
            style: TextStyle(color: theme.colorScheme.primary, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 24),
          const _NavItem(
            icon: Icons.menu_book_outlined,
            label: '我的课程',
            selected: true,
          ),
          const _NavItem(
            icon: Icons.assignment_turned_in_outlined,
            label: '我的成绩',
          ),
          const _NavItem(
            icon: Icons.favorite_outline,
            label: '我的收藏',
          ),
          const Spacer(),
          ElevatedButton.icon(
            onPressed: isLoading ? null : () => onRefresh(),
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            icon: isLoading
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                  )
                : const Icon(Icons.refresh),
            label: Text(isLoading ? '同步中...' : '刷新课程'),
          ),
        ],
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({
    required this.session,
    required this.onRefresh,
    required this.isLoading,
  });

  final UnipusSessionInfo? session;
  final Future<void> Function() onRefresh;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '校内课程',
                  style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  session?.name.isNotEmpty == true
                      ? '欢迎回来，${session!.name}'
                      : '欢迎使用 Unipus 课程助手',
                  style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          OutlinedButton.icon(
            onPressed: isLoading ? null : () => onRefresh(),
            icon: const Icon(Icons.class_outlined),
            label: const Text('加入班课'),
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ],
      ),
    );
  }
}

class _ClassSection extends StatelessWidget {
  const _ClassSection({
    required this.classBlock,
    required this.onCourseTap,
  });

  final UnipusClassBlock classBlock;
  final void Function(UnipusClassBlock, UnipusClassBlockCoursesItem) onCourseTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 18,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      classBlock.className,
                      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      classBlock.dateRange.isNotEmpty
                          ? '记分期限：${classBlock.dateRange}'
                          : '暂未同步记分时间',
                      style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              if (classBlock.startDate.isNotEmpty || classBlock.endDate.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${classBlock.startDate} 至 ${classBlock.endDate}',
                    style: TextStyle(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
          if (classBlock.courses.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 32),
              child: Center(child: Text('该班级暂无课程')),
            )
          else
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                for (final course in classBlock.courses)
                  _CourseCard(
                    classBlock: classBlock,
                    course: course,
                    onTap: onCourseTap,
                  ),
              ],
            ),
        ],
      ),
    );
  }
}

class _CourseCard extends StatelessWidget {
  const _CourseCard({
    required this.classBlock,
    required this.course,
    required this.onTap,
  });

  final UnipusClassBlock classBlock;
  final UnipusClassBlockCoursesItem course;
  final void Function(UnipusClassBlock, UnipusClassBlockCoursesItem) onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final subtitle = course.status;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => onTap(classBlock, course),
        child: Container(
          width: 260,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.grey.withOpacity(0.15)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 12,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CourseCover(imageUrl: course.image),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.courseName ?? '未命名课程',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    if (subtitle.isNotEmpty)
                      Text(
                        subtitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CourseCover extends StatelessWidget {
  const _CourseCover({required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return _CoverPlaceholder(
        child: Icon(
          Icons.menu_book,
          size: 48,
          color: Colors.white.withOpacity(0.9),
        ),
      );
    }

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return _CoverPlaceholder(
              child: Icon(
                Icons.broken_image_outlined,
                size: 40,
                color: Colors.white.withOpacity(0.9),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CoverPlaceholder extends StatelessWidget {
  const _CoverPlaceholder({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
      child: Container(
        color: theme.colorScheme.primary.withOpacity(0.4),
        height: 140,
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    this.selected = false,
  });

  final IconData icon;
  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = selected ? theme.colorScheme.primary : Colors.grey[600];
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        color: selected ? theme.colorScheme.primary.withOpacity(0.08) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(width: 12),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
