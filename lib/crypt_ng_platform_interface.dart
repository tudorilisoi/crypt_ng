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

  Future<String?> generateRandomKey() {
    throw UnimplementedError('generateRandomKey() has not been implemented.');
  }
  Future<String?> generateSalt() {
    throw UnimplementedError('generateSalt() has not been implemented.');
  }
  Future<String?> generateKeyFromPassword(String password, String salt) {
    throw UnimplementedError('generateKeyFromPassword() has not been implemented.');
  }
  Future<String?> encrypt(String? data, String? key){
    throw UnimplementedError('encrypt() has not been implemented.');
  }
  Future<String?> decrypt(String? data, String? key){
    throw UnimplementedError('decrypt() has not been implemented.');
  }
}
