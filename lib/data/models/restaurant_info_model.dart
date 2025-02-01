class RestaurantInfoModel {
  int? status;
  String? message;
  StoreInfo? store;

  RestaurantInfoModel({this.status, this.message, this.store});

  RestaurantInfoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    store = json['data'] != null ? StoreInfo.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (store != null) {
      data['data'] = store!.toJson();
    }
    return data;
  }
}

class StoreInfo {
  String? name;
  String? profileImageUrl;
  String? averageDeliveryTime;
  String? averageRating;
  String? totalRating;
  int? minOrderAmount;
  String? currency;
  String? deliveryMode;
  String? distance;

  StoreInfo(
      {this.name,
      this.profileImageUrl,
      this.averageDeliveryTime,
      this.averageRating,
      this.totalRating,
      this.minOrderAmount,
      this.currency,
      this.deliveryMode,
      this.distance});

  StoreInfo.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    profileImageUrl = json['ProfileImageUrl'];
    averageDeliveryTime = json['AverageDeliveryTime'];
    averageRating = json['AverageRating'];
    totalRating = json['TotalRating'];
    minOrderAmount = json['MinOrderAmount'];
    currency = json['Currency'];
    deliveryMode = json['DeliveryMode'];
    distance = json['Distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Name'] = name;
    data['ProfileImageUrl'] = profileImageUrl;
    data['AverageDeliveryTime'] = averageDeliveryTime;
    data['AverageRating'] = averageRating;
    data['TotalRating'] = totalRating;
    data['MinOrderAmount'] = minOrderAmount;
    data['Currency'] = currency;
    data['DeliveryMode'] = deliveryMode;
    data['Distance'] = distance;
    return data;
  }
}
