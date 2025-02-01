import 'dart:convert';
import 'dart:developer';

import 'package:food_app_wtn/data/models/restaurant_menu_model.dart';
import 'package:food_app_wtn/data/urls.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart';

class RestaurantMenuController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  RestaurantMenuModel _restaurantMenuModel = RestaurantMenuModel();
  List<Menu>? get menus => _restaurantMenuModel.menus;

  Future<void> getRestaurantMenu() async {
    _isLoading = true;
    update();

    Response response = await get(Uri.parse(Urls.restaurantMenu));

    if (response.statusCode == 200) {
      _restaurantMenuModel = RestaurantMenuModel.fromJson(jsonDecode(response.body));
    } else {
      log(response.body.toString());
    }

    _isLoading = false;
    update();
  }
}
