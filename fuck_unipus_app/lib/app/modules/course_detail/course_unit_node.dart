class CourseUnitNode {
  CourseUnitNode({
    required this.title,
    required this.url,
    required this.indexPath,
    required this.required,
    required this.passed,
    required this.children,
  });

  final String title;
  final String url;
  final List<int> indexPath;
  final bool required;
  final bool passed;
  final List<CourseUnitNode> children;

  bool get isLeaf => children.isEmpty;

  String get label => indexPath.join('.') + (indexPath.isEmpty ? '' : ' ') + title;
}
