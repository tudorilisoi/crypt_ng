import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:crypt_ng/crypt_ng_method_channel.dart';

void main() {
  MethodChannelCryptNg platform = MethodChannelCryptNg();
  const MethodChannel channel = MethodChannel('crypt_ng');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
