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
  int BlockId;
  String Name;
  String PostalCode;
  int Floors;
  Block({
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
    };
  }

  factory Block.fromMap(Map<String, dynamic> map) {
    return Block(
      BlockId: map['BlockId'] as int,
      Name: map['Name'] as String,
      PostalCode: map['PostalCode'] as String,
      Floors: map['Floors'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Block.fromJson(dynamic source) =>
      Block.fromMap(json.decode(source) as Map<String, dynamic>);
}
