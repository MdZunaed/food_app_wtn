import 'package:flutter/material.dart';
import 'package:food_app_wtn/constants/app_colors.dart';
import 'package:food_app_wtn/utils/bindings.dart';
import 'package:food_app_wtn/view/screens/store_details_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Urbanist',
        primaryColor: AppColors.primary,
        colorScheme: const ColorScheme.light(primary: AppColors.primary),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style:
                ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: Colors.white)),
      ),
      initialBinding: ControllerBindings(),
      home: const StoreDetailsScreen(),
    );
  }
}
