class AddFoodModel {
int? statusCode;
ResponseData? responseData;

AddFoodModel({this.statusCode, this.responseData});

AddFoodModel.fromJson(Map<String, dynamic> json) {
statusCode = json['statusCode'];
responseData = json['responseData'] != null ? new ResponseData.fromJson(json['responseData']) : null;
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['statusCode'] = this.statusCode;
  if (this.responseData != null) {
    data['responseData'] = this.responseData!.toJson();
  }
  return data;
}
}

class ResponseData {
  String? message;
  List<FoodItemList>? foodItemList;
  int? isAdmin;

  ResponseData({this.message, this.foodItemList, this.isAdmin});

  ResponseData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['foodItemList'] != null) {
      foodItemList = <FoodItemList>[];
      json['foodItemList'].forEach((v) { foodItemList!.add(new FoodItemList.fromJson(v)); });
    }
    isAdmin = json['isAdmin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.foodItemList != null) {
      data['foodItemList'] = this.foodItemList!.map((v) => v.toJson()).toList();
    }
    data['isAdmin'] = this.isAdmin;
    return data;
  }
}

class FoodItemList {
  String? name;
  String? foodId;
  int? price;
  int? status;
  String? description;
  int? isAvailable;
  int? availableQuantity;
  List<String>? images;
  VendorDetail? vendorDetail;
  int? isDeleted;

  FoodItemList({this.name, this.foodId, this.price, this.status, this.description, this.isAvailable, this.availableQuantity, this.images, this.vendorDetail, this.isDeleted});

  FoodItemList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    foodId = json['foodId'];
    price = json['price'];
    status = json['status'];
    description = json['description'];
    isAvailable = json['isAvailable'];
    availableQuantity = json['availableQuantity'];
    images = json['images'].cast<String>();
    vendorDetail = json['vendorDetail'] != null ? new VendorDetail.fromJson(json['vendorDetail']) : null;
    isDeleted = json['isDeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['foodId'] = this.foodId;
    data['price'] = this.price;
    data['status'] = this.status;
    data['description'] = this.description;
    data['isAvailable'] = this.isAvailable;
    data['availableQuantity'] = this.availableQuantity;
    data['images'] = this.images;
    if (this.vendorDetail != null) {
      data['vendorDetail'] = this.vendorDetail!.toJson();
    }
    data['isDeleted'] = this.isDeleted;
    return data;
  }
}

class VendorDetail {
  String? vendorId;
  String? name;
  String? phoneNo;
  String? email;

  VendorDetail({this.vendorId, this.name, this.phoneNo, this.email});

  VendorDetail.fromJson(Map<String, dynamic> json) {
    vendorId = json['vendorId'];
    name = json['name'];
    phoneNo = json['phoneNo'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vendorId'] = this.vendorId;
    data['name'] = this.name;
    data['phoneNo'] = this.phoneNo;
    data['email'] = this.email;
    return data;
  }
}

