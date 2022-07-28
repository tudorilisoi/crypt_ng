#import "CryptNgPlugin.h"
#if __has_include(<crypt_ng/crypt_ng-Swift.h>)
#import <crypt_ng/crypt_ng-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "crypt_ng-Swift.h"
#endif

@implementation CryptNgPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCryptNgPlugin registerWithRegistrar:registrar];
}
@end
