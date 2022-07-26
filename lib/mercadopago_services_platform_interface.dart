import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'mercadopago_services_method_channel.dart';

abstract class MercadopagoServicesPlatform extends PlatformInterface {
  /// Constructs a MercadopagoServicesPlatform.
  MercadopagoServicesPlatform() : super(token: _token);

  static final Object _token = Object();

  static MercadopagoServicesPlatform _instance = MethodChannelMercadopagoServices();

  /// The default instance of [MercadopagoServicesPlatform] to use.
  ///
  /// Defaults to [MethodChannelMercadopagoServices].
  static MercadopagoServicesPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MercadopagoServicesPlatform] when
  /// they register themselves.
  static set instance(MercadopagoServicesPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
