import 'dart:convert';

RestaurantOfferModel restaurantOfferModelFromJson(String str) =>
    RestaurantOfferModel.fromJson(json.decode(str));

String restaurantOfferModelToJson(RestaurantOfferModel data) => json.encode(data.toJson());

class RestaurantOfferModel {
  int? status;
  String? message;
  List<Offer>? offers;

  RestaurantOfferModel({
    this.status,
    this.message,
    this.offers,
  });

  factory RestaurantOfferModel.fromJson(Map<String, dynamic> json) => RestaurantOfferModel(
        status: json["status"],
        message: json["message"],
        offers: json["data"] == null ? [] : List<Offer>.from(json["data"].map((x) => Offer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": offers == null ? [] : List<dynamic>.from(offers!.map((x) => x.toJson())),
      };
}

class Offer {
  String? discount;
  String? discountType;
  int? minimumOrderAmount;
  String? deliveryMode;

  Offer({
    this.discount,
    this.discountType,
    this.minimumOrderAmount,
    this.deliveryMode,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        discount: json["Discount"],
        discountType: json["DiscountType"],
        minimumOrderAmount: json["MinimumOrderAmount"],
        deliveryMode: json["DeliveryMode"],
      );

  Map<String, dynamic> toJson() => {
        "Discount": discount,
        "DiscountType": discountType,
        "MinimumOrderAmount": minimumOrderAmount,
        "DeliveryMode": deliveryMode,
      };
}
