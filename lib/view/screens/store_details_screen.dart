import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app_wtn/constants/app_colors.dart';
import 'package:food_app_wtn/constants/app_text_styles.dart';
import 'package:food_app_wtn/constants/dimensions.dart';
import 'package:food_app_wtn/data/models/restaurant_info_model.dart';
import 'package:food_app_wtn/utils/images.dart';
import 'package:food_app_wtn/view/controllers/homepage_controller.dart';
import 'package:food_app_wtn/view/controllers/restaurant_info_controller.dart';
import 'package:food_app_wtn/view/controllers/restaurant_menu_controller.dart';
import 'package:food_app_wtn/view/controllers/restaurantt_offer_controller.dart';
import 'package:food_app_wtn/view/widgets/discount_card.dart';
import 'package:food_app_wtn/view/widgets/food_item_card.dart';
import 'package:get/get.dart';

import '../widgets/image_button.dart';

class StoreDetailsScreen extends StatefulWidget {
  const StoreDetailsScreen({super.key});

  @override
  State<StoreDetailsScreen> createState() => _StoreDetailsScreenState();
}

class _StoreDetailsScreenState extends State<StoreDetailsScreen> {
  //ScrollController scrollController = ScrollController();
  final homePageController = Get.find<HomePageController>();

  @override
  void initState() {
    super.initState();
    Get.find<RestaurantInfoController>().getRestaurantInfo();
    Get.find<RestaurantOfferController>().getRestaurantOffer();
    Get.find<RestaurantMenuController>().getRestaurantMenu();
  }

  //•
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: GetBuilder<RestaurantInfoController>(builder: (controller) {
        if (controller.isLoading) {
          return const Center(child: CupertinoActivityIndicator(color: AppColors.primary));
        }
        StoreInfo? store = controller.store;
        return SafeArea(
          child: CustomScrollView(
            controller: homePageController.scrollController,
            slivers: [
              SliverAppBar(
                expandedHeight: 250,
                //pinned: true,
                leading: IconButton.filled(
                    onPressed: () {}, icon: const Icon(Icons.arrow_back, color: Colors.white)),
                actions: [
                  ImageButton(image: Images.favourite, onTap: () {}),
                  ImageButton(image: Images.search, onTap: () {}),
                  ImageButton(image: Images.more, onTap: () {}),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(store?.profileImageUrl ?? Images.errorImage, fit: BoxFit.cover),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(Dimensions.paddingDefault),
                  decoration: const BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Text(
                                  store?.name ?? "Restaurant Name",
                                  style: boldTextStyle.copyWith(fontSize: 20),
                                ),
                                const SizedBox(width: 2),
                                Image.asset(Images.info, height: 18)
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Image.asset(Images.star, height: 16),
                                  const SizedBox(width: Dimensions.paddingVerySmall),
                                  Text(store?.averageRating ?? '0.0',
                                      style: mediumTextStyle.copyWith(fontSize: 17)),
                                ],
                              ),
                              Text("${store?.totalRating ?? 0} rating"),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(Images.clock, height: 20),
                              const SizedBox(width: 5),
                              Text("Delivery ${store?.averageDeliveryTime ?? 0}"),
                              const SizedBox(width: 8),
                              Image.asset(Images.send, height: 20),
                              const SizedBox(width: 5),
                              Text(
                                "${store?.distance ?? 0} away",
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text("Review",
                              style: boldTextStyle.copyWith(fontSize: 16, color: AppColors.primary)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(Images.rider, height: 20),
                              const SizedBox(width: 8),
                              Text(store?.deliveryMode ?? "delivery mode",
                                  style: boldTextStyle.copyWith(color: AppColors.primary)),
                              const SizedBox(width: 8),
                              Text("Min order ${store?.minOrderAmount} ${store?.currency}"),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: Dimensions.paddingVerySmall, vertical: 2),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.grey),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Image.asset(Images.info, height: 16),
                                const SizedBox(width: 2),
                                const Text("More Info"),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: Dimensions.paddingDefault),
                      GetBuilder<RestaurantOfferController>(builder: (offerController) {
                        if (offerController.isLoading) {
                          return const Center(child: CupertinoActivityIndicator());
                        }
                        if (offerController.offers?.isEmpty ?? false || offerController.offers == null) {
                          return const Center(child: Text("No offer found"));
                        }
                        final offers = offerController.offers;
                        return SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              offers?.length ?? 0,
                              (index) => DiscountCard(
                                offer: offers?[index],
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: CategoryHeaderDelegate(),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(Dimensions.paddingDefault),
                      margin: const EdgeInsets.only(top: Dimensions.paddingDefault),
                      child: ListView.separated(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: homePageController.menus.length,
                        separatorBuilder: (c, i) => const SizedBox(height: Dimensions.paddingDefault),
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                homePageController.menus[index].menuName ?? 'Menu Name',
                                style: boldTextStyle.copyWith(fontSize: 20),
                              ),
                              ListView.separated(
                                shrinkWrap: true,
                                primary: false,
                                itemCount: homePageController
                                    .getFoodsByMenuId(homePageController.selectedMenuId.toInt())
                                    .length,
                                separatorBuilder: (c, i) => const SizedBox(height: Dimensions.paddingSmall),
                                itemBuilder: (context, index) {
                                  final food = homePageController
                                      .getFoodsByMenuId(homePageController.selectedMenuId.toInt())[index];
                                  return FoodItemCard(food: food);
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class CategoryHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final controller = Get.find<HomePageController>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSmall),
      decoration: const BoxDecoration(color: Colors.white),
      child: Obx(
        () => ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: controller.menus.length ?? 0,
          itemBuilder: (context, index) {
            final menu = controller.menus[index];
            bool isSelected = controller.selectedMenuId.value == menu.menuId;
            return InkWell(
              onTap: () => controller.changeSelectedMenu(menu.menuId!),
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: Dimensions.paddingSmall, horizontal: Dimensions.paddingDefault),
                margin: const EdgeInsets.symmetric(vertical: Dimensions.paddingVerySmall)
                    .copyWith(right: Dimensions.paddingVerySmall),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : Colors.white,
                  border: !isSelected ? Border.all(color: AppColors.grey) : null,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                    child: Text(
                  menu.menuName ?? "Menu",
                  style: mediumTextStyle.copyWith(color: isSelected ? Colors.white : Colors.black),
                )),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  double get maxExtent => 55;

  @override
  double get minExtent => 55;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
