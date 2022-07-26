import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mercadopago_services/mercadopago_services_method_channel.dart';

void main() {
  MethodChannelMercadopagoServices platform = MethodChannelMercadopagoServices();
  const MethodChannel channel = MethodChannel('mercadopago_services');

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
