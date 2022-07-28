import Flutter
import UIKit
import MercadoPagoSDK

public class SwiftMercadopagoServicesPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "mercadopago_services", binaryMessenger: registrar.messenger())
    let instance = SwiftMercadopagoServicesPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
