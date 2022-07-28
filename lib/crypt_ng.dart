
import 'crypt_ng_platform_interface.dart';

class CryptNg {
  Future<String?> getPlatformVersion() {
    return CryptNgPlatform.instance.getPlatformVersion();
  }
}
