class GetMyProfileModel {
  int? statusCode;
  ResponseVendorData? responseData;


  GetMyProfileModel({this.statusCode, this.responseData});

  GetMyProfileModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    responseData = json['responseData'] != null ? new ResponseVendorData.fromJson(json['responseData']) : null;
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
  EmployeeProfile? employeeProfile;


  ResponseData({this.message, this.employeeProfile});

  ResponseData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    employeeProfile = json['employeeProfile'] != null ? new EmployeeProfile.fromJson(json['employeeProfile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.employeeProfile != null) {
      data['employeeProfile'] = this.employeeProfile!.toJson();
    }
    return data;
  }
}

class ResponseVendorData {
  String? message;
  EmployeeProfile? employeeProfile;


  ResponseVendorData({this.message, this.employeeProfile});

  ResponseVendorData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    employeeProfile = json['profileData'] != null ? new EmployeeProfile.fromJson(json['profileData']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.employeeProfile != null) {
      data['profileData'] = this.employeeProfile!.toJson();
    }
    return data;
  }
}

class EmployeeProfile {
  String? employeeId;
  String? firstName;
  String? middleName;
  String? lastName;
  String? empId;
  int? gender;
  String? email;
  String? personalEmail;
  String? phone;
  String? alternateMob;
  int? dob;
  int? editRequest;
  int? dateOfJoining;
  int? walletBalance;
  int? couponWalletBalance;
  String? profileImage;
  int? status;
  int? isAdmin;
  int? isDelete;

  EmployeeProfile({this.employeeId, this.firstName, this.middleName, this.lastName, this.empId, this.gender, this.email, this.personalEmail, this.phone, this.alternateMob, this.dob, this.editRequest, this.dateOfJoining,  this.walletBalance, this.couponWalletBalance, this.profileImage, this.status, this.isAdmin, this.isDelete});

  EmployeeProfile.fromJson(Map<String, dynamic> json) {
    employeeId = json['employeeId'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    empId = json['empId'];
    gender = json['gender'];
    email = json['email'];
    personalEmail = json['personalEmail'];
    phone = json['phone'];
    alternateMob = json['alternateMob'];
    dob = json['dob'];
    editRequest = json['editRequest'];
    dateOfJoining = json['dateOfJoining'];
    walletBalance = json['walletBalance'];
    couponWalletBalance = json['couponWalletBalance'];
    profileImage = json['profileImage'];
    status = json['status'];
    isAdmin = json['isAdmin'];
    isDelete = json['isDelete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeeId'] = this.employeeId;
    data['firstName'] = this.firstName;
    data['middleName'] = this.middleName;
    data['lastName'] = this.lastName;
    data['empId'] = this.empId;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['personalEmail'] = this.personalEmail;
    data['phone'] = this.phone;
    data['alternateMob'] = this.alternateMob;
    data['dob'] = this.dob;
    data['editRequest'] = this.editRequest;
    data['dateOfJoining'] = this.dateOfJoining;
    data['walletBalance'] = this.walletBalance;
    data['couponWalletBalance'] = this.couponWalletBalance;
    data['profileImage'] = this.profileImage;
    data['status'] = this.status;
    data['isAdmin'] = this.isAdmin;
    data['isDelete'] = this.isDelete;
    return data;
  }
}


