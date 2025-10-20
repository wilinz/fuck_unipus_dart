import 'package:get/get.dart';

import '../../data/unipus_service.dart';
import 'leaf_detail_args.dart';

class LeafDetailController extends GetxController {
  LeafDetailController() : _service = Get.find<UnipusService>();

  final UnipusService _service;

  late final LeafDetailArgs args;

  final RxBool isLoading = false.obs;
  final RxnString errorMessage = RxnString();
  final Rxn<dynamic> content = Rxn<dynamic>();
  final Rxn<dynamic> summary = Rxn<dynamic>();
  final Rxn<dynamic> questions = Rxn<dynamic>();

  @override
  void onInit() {
    super.onInit();
    final rawArgs = Get.arguments;
    if (rawArgs is LeafDetailArgs) {
      args = rawArgs;
    } else {
      throw ArgumentError('缺少节点参数');
    }
    load();
  }

  Future<void> load() async {
    isLoading.value = true;
    errorMessage.value = null;

    try {
      final tutorialId = args.tutorialId;
      final url = args.url;
      final results = await Future.wait([
        _service.fetchLeafContent(tutorialId, url),
        _service.fetchLeafSummary(tutorialId, url),
        _service.fetchLeafQuestions(tutorialId, url),
      ]);

      content.value = results[0];
      summary.value = results[1];
      questions.value = results[2];
    } catch (e) {
      errorMessage.value = _formatError(e);
    } finally {
      isLoading.value = false;
    }
  }

  String breadcrumb() {
    final path = args.indexPath.join('.');
    if (path.isEmpty) {
      return args.title;
    }
    return '$path ${args.title}';
  }

  String _formatError(Object error) {
    final text = error.toString();
    final index = text.indexOf(': ');
    if (index != -1) {
      return text.substring(index + 2).trim();
    }
    return text;
  }
}
