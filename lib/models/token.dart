import 'dart:convert';

Token tokenFromJson(String str) => Token.fromMap(json.decode(str));

String tokenToJson(Token data) => json.encode(data.toMap());

class Token {
  Token({
    required this.cardId,
    required this.cardNumberLength,
    required this.cardholder,
    required this.creationDate,
    required this.dueDate,
    required this.esc,
    required this.expirationMonth,
    required this.expirationYear,
    required this.firstSixDigits,
    required this.id,
    required this.lastFourDigits,
    required this.lastModifiedDate,
    required this.luhnValidation,
    required this.publicKey,
    required this.securityCodeLength,
    required this.status,
    required this.truncCardNumber,
    required this.usedDate,
  });

  final String id;
  final String? cardId;
  final int? cardNumberLength;
  final Cardholder? cardholder;
  final dynamic creationDate;
  final dynamic dueDate;
  final dynamic esc;
  final int? expirationMonth;
  final int? expirationYear;
  final String? firstSixDigits;
  final String? lastFourDigits;
  final dynamic lastModifiedDate;
  final String luhnValidation;
  final String publicKey;
  final int? securityCodeLength;
  final String status;
  final dynamic truncCardNumber;
  final dynamic usedDate;

  factory Token.fromMap(Map<String, dynamic> json) => Token(
        cardId: json["card_id"],
        cardNumberLength: json["card_number_length"],
        cardholder: json["cardholder"] == null
            ? null
            : Cardholder.fromMap(json['cardholder']),
        creationDate: json["creation_date"],
        dueDate: json["due_date"],
        esc: json["esc"],
        expirationMonth: json["expiration_month"],
        expirationYear: json["expiration_year"],
        firstSixDigits: json["first_six_digits"],
        id: json["id"],
        lastFourDigits: json["last_four_digits"],
        lastModifiedDate: json["last_modified_date"],
        luhnValidation: json["luhn_validation"],
        publicKey: json["public_key"],
        securityCodeLength: json["security_code_length"],
        status: json["status"],
        truncCardNumber: json["trunc_card_number"],
        usedDate: json["used_date"],
      );

  Map<String, dynamic> toMap() => {
        "card_id": cardId,
        "card_number_length": cardNumberLength,
        "cardholder": cardholder?.toMap(),
        "creation_date": creationDate,
        "due_date": dueDate,
        "esc": esc,
        "expiration_month": expirationMonth,
        "expiration_year": expirationYear,
        "first_six_digits": firstSixDigits,
        "id": id,
        "last_four_digits": lastFourDigits,
        "last_modified_date": lastModifiedDate,
        "luhn_validation": luhnValidation,
        "public_key": publicKey,
        "security_code_length": securityCodeLength,
        "status": status,
        "trunc_card_number": truncCardNumber,
        "used_date": usedDate,
      };
}

class Cardholder {
  Cardholder({
    required this.identification,
    required this.name,
  });

  final Identification identification;
  final String name;

  factory Cardholder.fromMap(Map<String, dynamic> json) => Cardholder(
        identification: Identification.fromMap(json["identification"]),
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "identification": identification.toMap(),
        "name": name,
      };
}

class Identification {
  Identification({
    required this.number,
    required this.type,
  });

  final dynamic number;
  final dynamic type;

  factory Identification.fromMap(Map<String, dynamic> json) => Identification(
        number: json["number"],
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "number": number,
        "type": type,
      };
}
