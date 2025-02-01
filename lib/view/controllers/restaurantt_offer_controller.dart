import 'dart:convert';
import 'dart:developer';

import 'package:food_app_wtn/data/models/restaurant_offer_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart';

import '../../data/urls.dart';

class RestaurantOfferController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  RestaurantOfferModel _restaurantOfferModel = RestaurantOfferModel();
  List<Offer>? get offers => _restaurantOfferModel.offers;

  Future<void> getRestaurantOffer() async {
    _isLoading = true;
    update();

    Response response = await get(Uri.parse(Urls.restaurantOffer));

    if (response.statusCode == 200) {
      _restaurantOfferModel = RestaurantOfferModel.fromJson(jsonDecode(response.body));
    } else {
      log(response.body.toString());
    }

    _isLoading = false;
    update();
  }
}
