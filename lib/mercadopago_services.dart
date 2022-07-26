import 'package:flutter/services.dart';
import 'package:mercadopago_services/models/card_token.dart';
import 'package:mercadopago_services/models/saved_card_token.dart';
import 'package:mercadopago_services/models/token.dart';

class MercadoPagoServices {
  String? _publicKey;
  static const _platform = MethodChannel('mercadopago_services');
  static final MercadoPagoServices instance = MercadoPagoServices._internal();
  
  MercadoPagoServices._internal();

  static set publicKey(String value) {
    instance._publicKey = value;
  }

  static String get publicKey {
    assert(instance._publicKey != null,
        'La llave pública es necesaria y no se ha configurado.');
    return instance._publicKey!;
  }

  Future<Token> createToken(CardToken cardToken) async {
    final String result = await _platform.invokeMethod('createToken', {
      "publicKey": instance._publicKey,
      ...cardToken.toMap(),
    });
    return tokenFromJson(result);
  }

  Future<Token> createSavedCardToken(SavedCardToken cardToken) async {
    final String result = await _platform.invokeMethod(
      'createSavedCardToken',
      {
        "publicKey": instance._publicKey,
        ...cardToken.toMap(),
      },
    );
    return tokenFromJson(result);
  }
}
