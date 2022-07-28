
import 'crypt_ng_platform_interface.dart';

class CryptNg {
  Future<String?> generateRandomKey() {
    return CryptNgPlatform.instance.generateRandomKey();
  }
}
