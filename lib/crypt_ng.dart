
import 'crypt_ng_platform_interface.dart';

class CryptNg {
  Future<String?> generateRandomKey() {
    return CryptNgPlatform.instance.generateRandomKey();
  }
  Future<String?> generateSalt() {
    return CryptNgPlatform.instance.generateSalt();
  }
  Future<String?> generateKeyFromPassword(String password, String salt) {
    return CryptNgPlatform.instance.generateKeyFromPassword(password, salt);
  }
  Future<String?> encrypt(String data, String key) {
    return CryptNgPlatform.instance.encrypt(data, key);
  }
  Future<String?> decrypt(String data, String key) {
    return CryptNgPlatform.instance.decrypt(data, key);
  }
}
