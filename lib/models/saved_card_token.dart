class SavedCardToken {
  final String id;
  final String securityCode;

  SavedCardToken({
    required this.id,
    required this.securityCode,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'securityCode': securityCode,
    };
  }

  factory SavedCardToken.fromMap(Map<String, dynamic> map) {
    return SavedCardToken(
      id: map['id'],
      securityCode: map['securityCode'],
    );
  }
}
