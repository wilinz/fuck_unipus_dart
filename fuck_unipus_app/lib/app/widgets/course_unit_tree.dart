import 'package:flutter/material.dart';

import '../modules/course_detail/course_unit_node.dart';

typedef _LeafTap = ValueChanged<CourseUnitNode>;

class CourseUnitTree extends StatelessWidget {
  const CourseUnitTree({
    super.key,
    required this.nodes,
    required this.onLeafTap,
  });

  final List<CourseUnitNode> nodes;
  final _LeafTap onLeafTap;

  @override
  Widget build(BuildContext context) {
    if (nodes.isEmpty) {
      return const Center(child: Text('未获取到课程节点'));
    }

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 12),
      children: [
        for (final node in nodes)
          node.children.isEmpty
              ? _LeafNode(
                  node: node,
                  depth: 0,
                  accentColor: _resolveAccentColor(0),
                  onLeafTap: onLeafTap,
                )
              : _BranchNode(
                  key: GlobalKey<_BranchNodeState>(),
                  node: node,
                  depth: 0,
                  accentColor: _resolveAccentColor(0),
                  onLeafTap: onLeafTap,
                ),
        const SizedBox(height: 12),
      ],
    );
  }
}

class _BranchNode extends StatefulWidget {
  const _BranchNode({
    super.key,
    required this.node,
    required this.depth,
    required this.accentColor,
    required this.onLeafTap,
  });

  final CourseUnitNode node;
  final int depth;
  final Color accentColor;
  final _LeafTap onLeafTap;

  @override
  State<_BranchNode> createState() => _BranchNodeState();
}

class _BranchNodeState extends State<_BranchNode> {
  late bool _expanded;
  final List<GlobalKey<_BranchNodeState>> _branchChildrenKeys = [];

  @override
  void initState() {
    super.initState();
    _expanded = widget.depth < 1;
  }

  void expandRecursively() {
    if (!_expanded) {
      setState(() => _expanded = true);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        for (final key in _branchChildrenKeys) {
          key.currentState?.expandRecursively();
        }
      });
    } else {
      for (final key in _branchChildrenKeys) {
        key.currentState?.expandRecursively();
      }
    }
  }

  void collapseRecursively() {
    if (_expanded) {
      setState(() => _expanded = false);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        for (final key in _branchChildrenKeys) {
          key.currentState?.collapseRecursively();
        }
      });
    } else {
      for (final key in _branchChildrenKeys) {
        key.currentState?.collapseRecursively();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final node = widget.node;
    final theme = Theme.of(context);
    final accentColor = widget.accentColor;

    final chips = <Widget>[
      _StatusChip(
        label: node.required ? '必修' : '选修',
        background: node.required
            ? const Color(0xFFE8F2FF)
            : const Color(0xFFF8F9FE),
        color: node.required
            ? const Color(0xFF2F6FED)
            : const Color(0xFF6B7280),
      ),
      if (node.passed)
        _StatusChip(
          label: '已完成',
          background: const Color(0xFFE6F4EA),
          color: const Color(0xFF1B9E59),
        ),
      if (node.indexPath.isNotEmpty)
        _IndexBadge(indexPath: node.indexPath),
    ];

    final total = node.children.length;
    final requiredCount =
        node.children.where((child) => child.required).length;
    final completed = node.children.where((child) => child.passed).length;
    final progressText =
        '必修：$requiredCount · 完成：$completed / $total';

    final branchChildren = <Widget>[];
    _branchChildrenKeys.clear();
    for (final child in node.children) {
      final childColor = _resolveAccentColor(widget.depth + 1);
      if (child.children.isEmpty) {
        branchChildren.add(
          _LeafNode(
            node: child,
            depth: widget.depth + 1,
            accentColor: childColor,
            onLeafTap: widget.onLeafTap,
          ),
        );
      } else {
        final key = GlobalKey<_BranchNodeState>();
        _branchChildrenKeys.add(key);
        branchChildren.add(
          _BranchNode(
            key: key,
            node: child,
            depth: widget.depth + 1,
            accentColor: childColor,
            onLeafTap: widget.onLeafTap,
          ),
        );
      }
    }

    return Padding(
      padding: EdgeInsets.only(
        left: widget.depth * 18.0 + 16,
        right: 16,
        bottom: 8,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: accentColor.withOpacity(node.passed ? 0.35 : 0.55),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => setState(() => _expanded = !_expanded),
                    icon: AnimatedRotation(
                      turns: _expanded ? 0.5 : 0.0,
                      duration: const Duration(milliseconds: 180),
                      child: const Icon(Icons.expand_more),
                    ),
                  ),
                  Expanded(
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
                                    node.title,
                                    style: theme.textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    progressText,
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            Wrap(
                              spacing: 6,
                              runSpacing: 4,
                              alignment: WrapAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: expandRecursively,
                                  child: const Text('展开全部'),
                                ),
                                TextButton(
                                  onPressed: collapseRecursively,
                                  child: const Text('收起全部'),
                                ),
                              ],
                            ),
                          ],
                        ),
                        if (chips.isNotEmpty) ...[
                          const SizedBox(height: 6),
                          Wrap(
                            spacing: 6,
                            runSpacing: 6,
                            children: chips,
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
            AnimatedCrossFade(
              firstChild: const SizedBox.shrink(),
              secondChild: Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                  bottom: 12,
                ),
                child: Column(children: branchChildren),
              ),
              crossFadeState: _expanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 200),
            ),
          ],
        ),
      ),
    );
  }
}

class _LeafNode extends StatelessWidget {
  const _LeafNode({
    required this.node,
    required this.depth,
    required this.accentColor,
    required this.onLeafTap,
  });

  final CourseUnitNode node;
  final int depth;
  final Color accentColor;
  final _LeafTap onLeafTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(left: depth * 18.0 + 16, right: 16, bottom: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: accentColor.withOpacity(node.passed ? 0.35 : 0.55),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      node.title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: [
                        _StatusChip(
                          label: node.required ? '必修' : '选修',
                          background: node.required
                              ? const Color(0xFFE8F2FF)
                              : const Color(0xFFF8F9FE),
                          color: node.required
                              ? const Color(0xFF2F6FED)
                              : const Color(0xFF6B7280),
                        ),
                        if (node.passed)
                          _StatusChip(
                            label: '已完成',
                            background: const Color(0xFFE6F4EA),
                            color: const Color(0xFF1B9E59),
                          ),
                        if (node.indexPath.isNotEmpty)
                          _IndexBadge(indexPath: node.indexPath),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              TextButton.icon(
                onPressed:
                    node.url.isEmpty ? null : () => onLeafTap(node),
                icon: const Icon(Icons.arrow_outward_rounded, size: 18),
                label: const Text('进入'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({
    required this.label,
    required this.background,
    required this.color,
  });

  final String label;
  final Color background;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _IndexBadge extends StatelessWidget {
  const _IndexBadge({required this.indexPath});

  final List<int> indexPath;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.10),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        indexPath.join('.'),
        style: TextStyle(
          color: theme.colorScheme.primary,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

const _accentPalette = [
  Color(0xFF4C6EF5),
  Color(0xFF845EF7),
  Color(0xFF339AF0),
  Color(0xFF12B886),
  Color(0xFFFF922B),
  Color(0xFFFA5252),
  Color(0xFF7048E8),
  Color(0xFF5C7CFA),
];

Color _resolveAccentColor(int depth) {
  return _accentPalette[depth % _accentPalette.length];
}
