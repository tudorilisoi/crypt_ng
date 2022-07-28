import 'package:flutter_test/flutter_test.dart';
import 'package:crypt_ng/crypt_ng.dart';
import 'package:crypt_ng/crypt_ng_platform_interface.dart';
import 'package:crypt_ng/crypt_ng_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCryptNgPlatform 
    with MockPlatformInterfaceMixin
    implements CryptNgPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final CryptNgPlatform initialPlatform = CryptNgPlatform.instance;

  test('$MethodChannelCryptNg is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelCryptNg>());
  });

  test('getPlatformVersion', () async {
    CryptNg cryptNgPlugin = CryptNg();
    MockCryptNgPlatform fakePlatform = MockCryptNgPlatform();
    CryptNgPlatform.instance = fakePlatform;
  
    expect(await cryptNgPlugin.getPlatformVersion(), '42');
  });
}
