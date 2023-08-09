class RegisterModel {
  int? success;
  int? code;
  String? message;
  Body? body;

  RegisterModel({this.success, this.code, this.message, this.body});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.body != null) {
      data['body'] = this.body!.toJson();
    }
    return data;
  }
}

class Body {
  int? id;
  String? name;
  String? email;
  String? otp;
  String? authorization;
  String? socialId;
  int? accountType;
  int? socialType;
  int? deviceType;
  String? deviceToken;
  int? todayWords;
  int? todayChatCount;
  int? subscription;
  int? expireDate;
  int? isVerified;
  String? image;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? subscriptionType;
  AppVersion? appVersion;
  String? appStoreUrl;
  String? playStoreUrl;

  Body(
      {this.id,
        this.name,
        this.email,
        this.otp,
        this.authorization,
        this.socialId,
        this.accountType,
        this.socialType,
        this.deviceType,
        this.deviceToken,
        this.todayWords,
        this.todayChatCount,
        this.subscription,
        this.expireDate,
        this.isVerified,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.subscriptionType,
        this.appVersion,
        this.appStoreUrl,
        this.playStoreUrl});

  Body.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    otp = json['otp'];
    authorization = json['authorization'];
    socialId = json['social_id'];
    accountType = json['account_type'];
    socialType = json['social_type'];
    deviceType = json['device_type'];
    deviceToken = json['device_token'];
    todayWords = json['today_words'];
    todayChatCount = json['today_chat_count'];
    subscription = json['subscription'];
    expireDate = json['expire_date'];
    isVerified = json['is_verified'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    subscriptionType = json['subscription_type'];
    appVersion = json['app_version'] != null
        ? new AppVersion.fromJson(json['app_version'])
        : null;
    appStoreUrl = json['appStoreUrl'];
    playStoreUrl = json['playStoreUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['otp'] = this.otp;
    data['authorization'] = this.authorization;
    data['social_id'] = this.socialId;
    data['account_type'] = this.accountType;
    data['social_type'] = this.socialType;
    data['device_type'] = this.deviceType;
    data['device_token'] = this.deviceToken;
    data['today_words'] = this.todayWords;
    data['today_chat_count'] = this.todayChatCount;
    data['subscription'] = this.subscription;
    data['expire_date'] = this.expireDate;
    data['is_verified'] = this.isVerified;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['subscription_type'] = this.subscriptionType;
    if (this.appVersion != null) {
      data['app_version'] = this.appVersion!.toJson();
    }
    data['appStoreUrl'] = this.appStoreUrl;
    data['playStoreUrl'] = this.playStoreUrl;
    return data;
  }
}

class AppVersion {
  int? id;
  String? android;
  String? ios;
  String? createdAt;
  String? updatedAt;

  AppVersion({this.id, this.android, this.ios, this.createdAt, this.updatedAt});

  AppVersion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    android = json['android'];
    ios = json['ios'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['android'] = this.android;
    data['ios'] = this.ios;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}