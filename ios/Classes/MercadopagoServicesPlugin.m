#import "MercadopagoServicesPlugin.h"
#if __has_include(<mercadopago_services/mercadopago_services-Swift.h>)
#import <mercadopago_services/mercadopago_services-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "mercadopago_services-Swift.h"
#endif

@implementation MercadopagoServicesPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMercadopagoServicesPlugin registerWithRegistrar:registrar];
}
@end
