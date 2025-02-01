class RestaurantMenuModel {
  int? status;
  String? message;
  List<Menu>? menus;

  RestaurantMenuModel({this.status, this.message, this.menus});

  RestaurantMenuModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      menus = <Menu>[];
      json['data'].forEach((v) {
        menus!.add(Menu.fromJson(v));
      });
    }
  }
}

class Menu {
  int? menuId;
  String? menuName;

  Menu({this.menuId, this.menuName});

  Menu.fromJson(Map<String, dynamic> json) {
    menuId = json['menuId'];
    menuName = json['MenuName'];
  }
}
