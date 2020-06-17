#import "AvrDudePlugin.h"
#if __has_include(<avr_dude/avr_dude-Swift.h>)
#import <avr_dude/avr_dude-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "avr_dude-Swift.h"
#endif

@implementation AvrDudePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAvrDudePlugin registerWithRegistrar:registrar];
}
@end
