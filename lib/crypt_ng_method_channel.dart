import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'crypt_ng_platform_interface.dart';

/// An implementation of [CryptNgPlatform] that uses method channels.
class MethodChannelCryptNg extends CryptNgPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('crypt_ng');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
