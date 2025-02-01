class Food {
  int? foodId;
  int? menuId;
  String? foodName;
  String? foodImage;
  int? foodPrice;
  String? foodDescription;
  bool? isShowVariant;
  String? currency;

  Food({
    this.foodId,
    this.menuId,
    this.foodName,
    this.foodImage,
    this.foodPrice,
    this.foodDescription,
    this.isShowVariant,
    this.currency,
  });

  Food.fromJson(Map<String, dynamic> json) {
    foodId = json['FoodId'];
    menuId = json['menuId'];
    foodName = json['FoodName'];
    foodImage = json['FoodImage'];
    foodPrice = json['FoodPrice'];
    foodDescription = json['FoodDescription'];
    isShowVariant = json['IsShowVariant'];
    currency = json['Currency'];
  }
}
