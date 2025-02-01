import 'package:flutter/material.dart';
import 'package:food_app_wtn/data/models/restaurant_offer_model.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/dimensions.dart';
import '../../utils/images.dart';

class DiscountCard extends StatelessWidget {
  final Offer? offer;
  const DiscountCard({super.key, this.offer});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          fit: StackFit.passthrough,
          clipBehavior: Clip.antiAlias,
          children: [
            Container(
              padding: const EdgeInsets.all(Dimensions.paddingDefault),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                gradient: LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topRight, colors: [
                  AppColors.primary,
                  AppColors.primary.withOpacity(0.6),
                ]),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(Images.discount, height: 25),
                      const SizedBox(width: Dimensions.paddingSmall),
                      Text("${offer?.discount}${offer?.discountType} off",
                          style: boldTextStyle.copyWith(fontSize: 22, color: Colors.white)),
                      const SizedBox(width: Dimensions.paddingSmall),
                      Text("upto ${offer?.minimumOrderAmount} AED",
                          style: lightTextStyle.copyWith(color: Colors.white)),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(Dimensions.paddingVerySmall),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(Dimensions.radiusDefault)),
                ),
                child: Center(
                  child: Text(
                    offer?.deliveryMode ?? "Delivery mode",
                    style: regularTextStyle.copyWith(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(width: Dimensions.paddingSmall)
      ],
    );
  }
}
