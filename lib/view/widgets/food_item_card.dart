import 'package:flutter/material.dart';
import 'package:food_app_wtn/data/models/restaurant_food_model.dart';
import 'package:food_app_wtn/utils/images.dart';
import 'package:food_app_wtn/view/screens/food_details_screen.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/dimensions.dart';
import '../../utils/strings.dart';

class FoodItemCard extends StatelessWidget {
  final Food food;
  const FoodItemCard({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (food.isShowVariant ?? false) {
          Get.to(() => const FoodDetailsScreen());
        } else {
          showExpandableBottomSheet(context);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(Dimensions.paddingSmall),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grey),
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                  child: Image.network(Images.dummyImage, width: 120, fit: BoxFit.cover)),
              const SizedBox(width: Dimensions.paddingSmall),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text(food.foodName ?? "Pizza margherita",
                                style: boldTextStyle.copyWith(fontSize: 18))),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: Dimensions.paddingVerySmall),
                          decoration: BoxDecoration(
                              color: Colors.amber.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
                          child: Row(
                            children: [
                              Image.asset(Images.star, height: 10),
                              Text(
                                "4.8",
                                style: regularTextStyle.copyWith(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: Dimensions.paddingVerySmall),
                    const Text(Strings.dummyDescription, maxLines: 2, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 2),
                    const Text("🔥popular"),
                    const SizedBox(height: Dimensions.paddingVerySmall),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                food.foodPrice.toString(),
                                style: boldTextStyle.copyWith(fontSize: 20, color: AppColors.primary),
                              ),
                              const SizedBox(width: Dimensions.paddingVerySmall),
                              Text(
                                food.foodPrice.toString(),
                                style: mediumTextStyle.copyWith(fontSize: 18, color: AppColors.greyDark),
                              ),
                            ],
                          ),
                        ),
                        Image.asset(Images.add, height: 20),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showExpandableBottomSheet(BuildContext context) {
    showModalBottomSheet(
      clipBehavior: Clip.antiAlias,
      context: context,
      isScrollControlled: true, // Allows the sheet to expand fully
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.5,
        maxChildSize: 0.93,
        expand: false,
        builder: (context, scrollController) {
          return FoodDetailsScreen(scrollController: scrollController, showVariant: false);
        },
      ),
    );
  }
}
