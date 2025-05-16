import 'dart:math';
import 'package:crypto/crypto.dart';

String generateRandomMd5() {
  final random = Random();
  List<int> randomBytes = List.generate(16, (_) => random.nextInt(256));
  var digest = md5.convert(randomBytes);
  return digest.toString();
}

extension RandomExtension on Random {
  /// 以指定的概率返回 true，概率值介于 0.0 到 1.0 之间。
  bool nextBoolWithProbability(double probability) {
    assert(probability >= 0.0 && probability <= 1.0);
    return nextDouble() < probability;
  }

  /// 生成一个指定范围内的随机 double，[min] inclusive, [max] exclusive。
  double nextDoubleInRange(double min, double max) {
    assert(min < max);
    return min + (max - min) * nextDouble();
  }

  /// 生成一个指定范围内的随机 int，[min] inclusive, [max] exclusive。
  int nextIntInRange(int min, int max) {
    assert(min < max);
    return min + nextInt(max - min);
  }

  /// 从一个非空列表中随机返回一个元素。
  T nextElement<T>(List<T> list) {
    assert(list.isNotEmpty);
    return list[nextInt(list.length)];
  }

  /// 返回一个列表的洗牌副本，不会改变原始列表。
  List<T> shuffleList<T>(List<T> list) {
    final copy = List<T>.from(list);
    copy.shuffle(this);
    return copy;
  }
}
