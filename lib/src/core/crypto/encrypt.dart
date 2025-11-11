import 'dart:convert';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart' as encrypt;

String encryptLoginUser(String e) {
  try {
    // 密钥和IV（十六进制字符串）
    const String keyHex = "8AD70B641C024C7ADA2ECD082EC0334F";
    const String ivHex = "0102030405060708090A0B0C0D0E0F10";

    // 将十六进制字符串转换为字节数组
    Uint8List hexToBytes(String hex) {
      return Uint8List.fromList(
          List.generate(
              hex.length ~/ 2,
                  (i) => int.parse(hex.substring(i * 2, i * 2 + 2), radix: 16)
          )
      );
    }

    // 创建 Key 和 IV
    final key = encrypt.Key(hexToBytes(keyHex));
    final iv = encrypt.IV(hexToBytes(ivHex));

    // 创建加密器
    final encrypter = encrypt.Encrypter(
        encrypt.AES(key, mode: encrypt.AESMode.cbc, padding: 'PKCS7')
    );

    // 加密
    final encrypted = encrypter.encrypt(e, iv: iv);

    // 返回密文的十六进制表示（大写）
    return encrypted.bytes
        .map((byte) => byte.toRadixString(16).padLeft(2, '0'))
        .join('')
        .toUpperCase();

  } catch (error) {
    print('Encryption error: $error');
    rethrow;
  }
}