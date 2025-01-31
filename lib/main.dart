import 'package:flutter/material.dart';
import 'package:food_app_wtn/constants/app_colors.dart';
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
        fontFamily: 'Urbanist',
        primaryColor: AppColors.primary,
        colorScheme: const ColorScheme.light(primary: AppColors.primary),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        //useMaterial3: true,
      ),
      home: const StoreDetailsScreen(),
    );
  }
}


