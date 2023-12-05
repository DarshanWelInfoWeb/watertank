class InsertQuotationBody {
  int? id;
  int? tankSize;
  int? tankType;
  String? tankTypename;
  String? waterType;
  int? amount;

  InsertQuotationBody(
      {this.id,this.tankSize, this.tankType, this.tankTypename, this.waterType,this.amount});

  InsertQuotationBody.fromJson(Map<dynamic, dynamic> map) {
    id = map['id'];
    tankSize = map['tankSize'];
    tankType = map['tankType'];
    tankTypename = map['tankTypename'];
    waterType = map['waterType'];
    amount = map['amount'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{
      'id': id,
      'tankSize': tankSize,
      'tankType': tankType,
      'tankTypename': tankTypename,
      'waterType': waterType,
      'amount': amount,
    };
    return map;
  }
}