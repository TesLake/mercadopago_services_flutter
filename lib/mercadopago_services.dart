
import 'mercadopago_services_platform_interface.dart';

class MercadopagoServices {
  Future<String?> getPlatformVersion() {
    return MercadopagoServicesPlatform.instance.getPlatformVersion();
  }
}
