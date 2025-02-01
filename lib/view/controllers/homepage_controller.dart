import 'package:flutter/material.dart';
import 'package:food_app_wtn/data/dummy_data.dart';
import 'package:food_app_wtn/data/models/restaurant_food_model.dart';
import 'package:food_app_wtn/data/models/restaurant_menu_model.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  var menus = <Menu>[].obs;
  var foods = <Food>[].obs;
  var selectedMenuId = 1.obs;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    loadLocalData();
    scrollController.addListener(_onScroll);
  }

  void loadLocalData() {
    menus.assignAll(
      menuData.map((e) => Menu.fromJson(e)).toList(),
    );

    foods.assignAll(
      foodData.map((e) => Food.fromJson(e)).toList(),
    );
  }

  void _onScroll() {
    double offset = scrollController.offset;
    for (var menu in menus) {
      var menuIndex = menus.indexOf(menu);
      var targetOffset = menuIndex * 200.0; // Approximate section height
      if (offset >= targetOffset) {
        selectedMenuId.value = menu.menuId!;
      }
    }
  }

  void scrollToCategory(int menuId) {
    int index = menus.indexWhere((m) => m.menuId == menuId);
    if (index != -1) {
      double targetOffset = index * 200.0; // Approximate height per section
      scrollController.animateTo(
        targetOffset,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  List<Food> getFoodsByMenuId(int menuId) {
    return foods.where((food) => food.menuId == menuId).toList();
  }

  void changeSelectedMenu(int menuId) {
    selectedMenuId.value = menuId;
  }
}
