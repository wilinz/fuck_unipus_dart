import 'dart:convert';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:hex/hex.dart' as hex;

extension _StringTrimEndMatches on String {
  /// Trims the part of the string that matches the [pattern] at the end of the string.
  ///
  /// The [pattern] can be a [String] and it will be checked at the end of the string.
  String trimEnd(String pattern) {
    int end = length;

    // 如果模式为空字符串，直接返回原始字符串
    if (pattern.isEmpty) return this;

    // 检查字符串尾部是否符合模式，逐步移除
    while (end > 0 && substring(end - pattern.length, end) == pattern) {
      end -= pattern.length;
    }

    return substring(0, end);
  }
}

String padKey(String key) {
  // Ensure the key is 16 bytes (AES-128)
  while (key.length < 16) {
    key += "\u0000"; // Padding with null characters
  }
  return key.substring(0, 16);
}

String aesEcbDecryptFromHex(String ciphertextHex, String key) {
  // Step 1: Convert hex string to bytes
  List<int> bytes = hex.HexDecoder().convert(ciphertextHex);

  // Step 2: Pad the key to ensure it's 16 bytes long
  String paddedKey = padKey(key);

  // Step 3: Create the AES cipher using the provided key
  final keyBytes = utf8.encode(paddedKey);
  final iv = encrypt.IV.fromLength(0); // ECB mode doesn't use an IV

  final aesKey = encrypt.Key(Uint8List.fromList(keyBytes));
  final encrypter = encrypt.Encrypter(
    encrypt.AES(aesKey, mode: encrypt.AESMode.ecb, padding: null),
  );

  // Step 4: Decrypt the data
  final decrypted = encrypter.decryptBytes(
    encrypt.Encrypted(Uint8List.fromList(bytes)),
    iv: iv,
  );

  // Step 5: Convert decrypted bytes to a string and trim null characters
  return utf8.decode(decrypted, allowMalformed: true).trimEnd("\u0000");
}

String? decryptUnipusContent(String content, String k) {
  // Extract the cipher and key
  String key = '1a2b3c4d$k';
  int index = content.indexOf(".");
  if (index == -1) {
    return null;
  }

  String cipherHex = content.substring(index + 1);
  return aesEcbDecryptFromHex(cipherHex, key);
}
