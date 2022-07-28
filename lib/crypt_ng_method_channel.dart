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
}
