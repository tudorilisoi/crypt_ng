import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'crypt_ng_platform_interface.dart';

/// An implementation of [CryptNgPlatform] that uses method channels.
class MethodChannelCryptNg extends CryptNgPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('crypt_ng');

  @override
  Future<String?> generateRandomKey() async {
    final key = await methodChannel.invokeMethod<String>('generate_random_key');
    return key;
  }
  @override
  Future<String?> generateSalt() async {
    final salt = await methodChannel.invokeMethod<String>('generate_salt');
    return salt;
  }
  @override
  Future<String?> generateKeyFromPassword(String password, String salt) async {
    final key = await methodChannel.invokeMethod("generate_key_from_password", <String, String>{
      "password": password,
      "salt": salt,
    });
    return key;
  }
  @override
  Future<String?> decrypt(String? data, String? key) async {
    try {
      final decrypted = await methodChannel.invokeMethod("decrypt", {
        "data": data,
        "key": key,
      });
      return decrypted;
    } on PlatformException catch (e) {
      switch (e.code) {
        case "mac_mismatch":
          throw new MacMismatchException();
        default:
          rethrow;
      }
    }
  }

  @override
  Future<String?> encrypt(String? data, String? key) async =>
      await methodChannel.invokeMethod("encrypt", {
        "data": data,
        "key": key,
      });
}

class MacMismatchException implements Exception {
  final String message =
      "Mac don't match, either the password is wrong, or the message has been forged.";
}