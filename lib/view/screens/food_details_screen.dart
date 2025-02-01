import 'package:flutter/material.dart';
import 'package:food_app_wtn/constants/app_colors.dart';
import 'package:food_app_wtn/constants/app_text_styles.dart';
import 'package:food_app_wtn/constants/dimensions.dart';
import 'package:food_app_wtn/utils/images.dart';
import 'package:food_app_wtn/utils/strings.dart';
import 'package:get/get.dart';

class FoodDetailsScreen extends StatelessWidget {
  final ScrollController? scrollController;
  final bool showVariant;
  const FoodDetailsScreen({super.key, this.scrollController, this.showVariant = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: SafeArea(
          child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(showVariant ? 0 : 20)),
                    child:
                        Image.network(Images.dummyImage, height: 250, width: Get.width, fit: BoxFit.cover)),
                if (showVariant)
                  Positioned(
                    child: IconButton.filled(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Get.back(),
                    ),
                  ),
                if (!showVariant)
                  Align(
                    alignment: Alignment.topCenter,
                    child: Center(
                      child: Container(
                        width: 70,
                        margin: const EdgeInsets.only(top: Dimensions.paddingVerySmall),
                        padding: const EdgeInsets.only(top: Dimensions.paddingSmall),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
                      ),
                    ),
                  )
              ],
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(Dimensions.paddingDefault),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Rice with Chicken", style: boldTextStyle.copyWith(fontSize: 20)),
                  const SizedBox(height: Dimensions.paddingSmall),
                  const Text(Strings.dummyDescription, style: regularTextStyle),
                  const SizedBox(height: Dimensions.paddingDefault),
                  if (showVariant)
                    Container(
                      padding: const EdgeInsets.all(Dimensions.paddingSmall),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        border: Border.all(color: AppColors.primary),
                        borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Add Variation", style: boldTextStyle.copyWith(fontSize: 18)),
                          const SizedBox(height: Dimensions.paddingSmall),
                          Column(
                            children: List.generate(
                              3,
                              (i) => const ListTile(
                                leading: Icon(Icons.circle_outlined),
                                title: Text("1:2"),
                                trailing: Text("AED 120", style: boldTextStyle),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            if (showVariant)
              Container(
                padding: const EdgeInsets.all(Dimensions.paddingDefault),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Special request", style: boldTextStyle.copyWith(fontSize: 20)),
                    const SizedBox(height: Dimensions.paddingSmall),
                    const Text(Strings.specialRequest, style: regularTextStyle),
                    const SizedBox(height: Dimensions.paddingDefault),
                    TextField(
                      maxLines: 2,
                      decoration: InputDecoration(
                          counterText: "0/500",
                          hintText: "e.g Hello",
                          hintStyle: regularTextStyle.copyWith(color: AppColors.greyDark),
                          enabledBorder:
                              const OutlineInputBorder(borderSide: BorderSide(color: AppColors.grey))),
                    )
                  ],
                ),
              ),
            const SizedBox(height: Dimensions.paddingDefault),
          ],
        ),
      )),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(Dimensions.paddingDefault).copyWith(top: Dimensions.paddingVerySmall),
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("AED 120", style: boldTextStyle.copyWith(fontSize: 20, color: AppColors.primary)),
                    const SizedBox(width: 5),
                    Text("AED 120", style: regularTextStyle.copyWith(color: AppColors.greyDark)),
                  ],
                ),
                Row(
                  children: [
                    const MiniButton(image: Images.delete),
                    const SizedBox(width: Dimensions.paddingSmall),
                    Text("1", style: boldTextStyle.copyWith(fontSize: 22)),
                    const SizedBox(width: Dimensions.paddingSmall),
                    const MiniButton(image: Images.add),
                  ],
                ),
              ],
            ),
            const SizedBox(height: Dimensions.paddingSmall),
            SizedBox(
              width: Get.width,
              height: 50,
              child: ElevatedButton(onPressed: () {}, child: const Text("Add to cart")),
            )
          ],
        ),
      ),
    );
  }
}

class MiniButton extends StatelessWidget {
  final String image;
  const MiniButton({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(Dimensions.paddingVerySmall),
        decoration:
            BoxDecoration(color: AppColors.grey.withOpacity(0.8), borderRadius: BorderRadius.circular(5)),
        child: Image.asset(image, height: 18),
      ),
    );
  }
}
