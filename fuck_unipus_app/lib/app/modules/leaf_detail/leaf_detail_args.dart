class LeafDetailArgs {
  LeafDetailArgs({
    required this.tutorialId,
    required this.url,
    required this.title,
    required this.indexPath,
    required this.required,
    required this.passed,
  });

  final String tutorialId;
  final String url;
  final String title;
  final List<int> indexPath;
  final bool required;
  final bool passed;
}
