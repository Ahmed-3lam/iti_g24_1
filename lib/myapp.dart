import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iti_g24_1/dummy_projects/ecommerce/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// (1) Material App
    /// (2) home: Screen (UI)
    /// (3) Scaffold ( widget )

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
