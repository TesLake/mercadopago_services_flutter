import 'package:flutter_test/flutter_test.dart';
import 'package:mercadopago_services/mercadopago_services.dart';
import 'package:mercadopago_services/mercadopago_services_platform_interface.dart';
import 'package:mercadopago_services/mercadopago_services_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMercadopagoServicesPlatform 
    with MockPlatformInterfaceMixin
    implements MercadopagoServicesPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final MercadopagoServicesPlatform initialPlatform = MercadopagoServicesPlatform.instance;

  test('$MethodChannelMercadopagoServices is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMercadopagoServices>());
  });

  test('getPlatformVersion', () async {
    MercadopagoServices mercadopagoServicesPlugin = MercadopagoServices();
    MockMercadopagoServicesPlatform fakePlatform = MockMercadopagoServicesPlatform();
    MercadopagoServicesPlatform.instance = fakePlatform;
  
    expect(await mercadopagoServicesPlugin.getPlatformVersion(), '42');
  });
}
