import 'dart:convert';
import 'dart:developer';

import 'package:food_app_wtn/data/models/restaurant_info_model.dart';
import 'package:food_app_wtn/data/urls.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart';

class RestaurantInfoController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  RestaurantInfoModel _restaurantInfoModel = RestaurantInfoModel();
  StoreInfo? get store => _restaurantInfoModel.store;

  Future<void> getRestaurantInfo() async {
    _isLoading = true;
    update();

    Response response = await get(Uri.parse(Urls.restaurantInfo));

    if (response.statusCode == 200) {
      _restaurantInfoModel = RestaurantInfoModel.fromJson(jsonDecode(response.body));
    } else {
      log(response.body.toString());
    }

    _isLoading = false;
    update();
  }
}
