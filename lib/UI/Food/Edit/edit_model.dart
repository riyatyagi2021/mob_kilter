class EditFoodModel {
  int? statusCode;
  ResponseData? responseData;
  RequestParams? requestParams;
  String? time;

  EditFoodModel(
      {this.statusCode, this.responseData, this.requestParams, this.time});

  EditFoodModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    responseData = json['responseData'] != null
        ? new ResponseData.fromJson(json['responseData'])
        : null;
    requestParams = json['requestParams'] != null
        ? new RequestParams.fromJson(json['requestParams'])
        : null;
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    if (this.responseData != null) {
      data['responseData'] = this.responseData!.toJson();
    }
    if (this.requestParams != null) {
      data['requestParams'] = this.requestParams!.toJson();
    }
    data['time'] = this.time;
    return data;
  }
}

class ResponseData {
  String? message;
  FoodItem? foodItem;
  int? isAdmin;

  ResponseData({this.message, this.foodItem, this.isAdmin});

  ResponseData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    foodItem = json['foodItem'] != null
        ? new FoodItem.fromJson(json['foodItem'])
        : null;
    isAdmin = json['isAdmin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.foodItem != null) {
      data['foodItem'] = this.foodItem!.toJson();
    }
    data['isAdmin'] = this.isAdmin;
    return data;
  }
}

class FoodItem {
  String? foodId;
  String? name;
  int? price;
  int? status;
  String? description;
  int? isAvailable;
  int? availableQuantity;
  List<String>? images;
  int? isDeleted;

  FoodItem(
      {this.foodId,
        this.name,
        this.price,
        this.status,
        this.description,
        this.isAvailable,
        this.availableQuantity,
        this.images,
        this.isDeleted});

  FoodItem.fromJson(Map<String, dynamic> json) {
    foodId = json['foodId'];
    name = json['name'];
    price = json['price'];
    status = json['status'];
    description = json['description'];
    isAvailable = json['isAvailable'];
    availableQuantity = json['availableQuantity'];
    images = json['images'].cast<String>();
    isDeleted = json['isDeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['foodId'] = this.foodId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['status'] = this.status;
    data['description'] = this.description;
    data['isAvailable'] = this.isAvailable;
    data['availableQuantity'] = this.availableQuantity;
    data['images'] = this.images;
    data['isDeleted'] = this.isDeleted;
    return data;
  }
}

class RequestParams {
  String? foodId;
  String? name;
  String? price;

  RequestParams({this.foodId, this.name, this.price});

  RequestParams.fromJson(Map<String, dynamic> json) {
    foodId = json['foodId'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['foodId'] = this.foodId;
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}