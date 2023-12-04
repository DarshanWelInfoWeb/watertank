class ItemList_Response {
  List<ItemData>? data;
  String? strMsg;
  String? error;

  ItemList_Response({this.data, this.strMsg, this.error});

  ItemList_Response.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ItemData>[];
      json['data'].forEach((v) {
        data!.add(new ItemData.fromJson(v));
      });
    }
    strMsg = json['strMsg'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['strMsg'] = this.strMsg;
    data['error'] = this.error;
    return data;
  }
}

class ItemData {
  int? intId;
  int? intCompanyId;
  String? itemName;

  ItemData({this.intId, this.intCompanyId, this.itemName});

  ItemData.fromJson(Map<String, dynamic> json) {
    intId = json['intId'];
    intCompanyId = json['intCompanyId'];
    itemName = json['itemName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['intId'] = this.intId;
    data['intCompanyId'] = this.intCompanyId;
    data['itemName'] = this.itemName;
    return data;
  }
}