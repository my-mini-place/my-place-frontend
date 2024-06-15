class Residence {
  final String residenceId;
  final String street;
  final String buildingNumber;
  final String apartmentNumber;
  final int floor;

  Residence({
    required this.residenceId,
    required this.street,
    required this.buildingNumber,
    required this.apartmentNumber,
    required this.floor,
  });

  factory Residence.fromJson(dynamic json) {
    return Residence(
      residenceId: json['residenceId'],
      street: json['street'],
      buildingNumber: json['buildingNumber'],
      apartmentNumber: json['apartmentNumber'],
      floor: json['floor'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'residenceId': residenceId,
      'street': street,
      'buildingNumber': buildingNumber,
      'apartmentNumber': apartmentNumber,
      'floor': floor,
    };
  }
}
