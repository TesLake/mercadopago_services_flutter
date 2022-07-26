import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'mercadopago_services_platform_interface.dart';

/// An implementation of [MercadopagoServicesPlatform] that uses method channels.
class MethodChannelMercadopagoServices extends MercadopagoServicesPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('mercadopago_services');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
