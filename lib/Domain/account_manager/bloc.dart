import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
//     public class Block
//     {
//         public int Id;
//         public string BlockId { get; set; } = null!;

//         public string Name { get; set; } = null!;
//         public string PostalCode { get; set; } = null!;
//         public int Floors { get; set; }
//     }
// }

class Block {
  String BlockId;
  String Name;
  String PostalCode;
  int Floors;
  String Street;
  String Number;

  Block({
    required this.Street,
    required this.Number,
    required this.BlockId,
    required this.Name,
    required this.PostalCode,
    required this.Floors,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'BlockId': BlockId,
      'Name': Name,
      'PostalCode': PostalCode,
      'Floors': Floors,
      'Street': Street,
      'Number': Number,
    };
  }

  factory Block.fromJson(dynamic map) {
    return Block(
      BlockId: map['blockId'] as String,
      Name: map['name'] as String,
      PostalCode: map['postalCode'] as String,
      Floors: map['floors'] as int,
      Number: map['number'] as String,
      Street: map['street'] as String,
    );
  }
}
