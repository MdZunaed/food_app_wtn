import 'package:food_app_wtn/view/controllers/homepage_controller.dart';
import 'package:food_app_wtn/view/controllers/restaurant_info_controller.dart';
import 'package:food_app_wtn/view/controllers/restaurant_menu_controller.dart';
import 'package:food_app_wtn/view/controllers/restaurantt_offer_controller.dart';
import 'package:get/get.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(RestaurantInfoController());
    Get.put(RestaurantOfferController());
    Get.put(RestaurantMenuController());
    Get.put(HomePageController());
  }
}
