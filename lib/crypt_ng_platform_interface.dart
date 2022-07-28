import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'crypt_ng_method_channel.dart';

abstract class CryptNgPlatform extends PlatformInterface {
  /// Constructs a CryptNgPlatform.
  CryptNgPlatform() : super(token: _token);

  static final Object _token = Object();

  static CryptNgPlatform _instance = MethodChannelCryptNg();

  /// The default instance of [CryptNgPlatform] to use.
  ///
  /// Defaults to [MethodChannelCryptNg].
  static CryptNgPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CryptNgPlatform] when
  /// they register themselves.
  static set instance(CryptNgPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
