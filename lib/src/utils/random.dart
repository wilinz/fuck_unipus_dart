import 'dart:math';
import 'package:crypto/crypto.dart';

String generateRandomMd5() {
  final random = Random();
  List<int> randomBytes = List.generate(16, (_) => random.nextInt(256));
  var digest = md5.convert(randomBytes);
  return digest.toString();
}