import 'dart:convert';

CardToken cardTokenFromMap(String str) => CardToken.fromMap(json.decode(str));

String cardTokenToMap(CardToken data) => json.encode(data.toMap());

class CardToken {
  CardToken({
    required this.cardNumber,
    required this.cardholderName,
    required this.cardExpirationMonth,
    required this.cardExpirationYear,
    required this.securityCode,
  });

  final String cardNumber;
  final String cardholderName;
  final int cardExpirationMonth;
  final int cardExpirationYear;
  final String securityCode;

  factory CardToken.fromMap(Map<String, dynamic> json) => CardToken(
        cardNumber: json["cardNumber"],
        cardholderName: json["cardholderName"],
        cardExpirationMonth: json["cardExpirationMonth"],
        cardExpirationYear: json["cardExpirationYear"],
        securityCode: json["securityCode"],
      );

  Map<String, dynamic> toMap() => {
        "cardNumber": cardNumber,
        "cardholderName": cardholderName,
        "cardExpirationMonth": cardExpirationMonth,
        "cardExpirationYear": cardExpirationYear,
        "securityCode": securityCode,
      };

  static CardToken defaultTestCard = CardToken(
    cardNumber: "4075595716483764",
    cardholderName: "APRO",
    cardExpirationMonth: 11,
    cardExpirationYear: 25,
    securityCode: "123",
  );
}
