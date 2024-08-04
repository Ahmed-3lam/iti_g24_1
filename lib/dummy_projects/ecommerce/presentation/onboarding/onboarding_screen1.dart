import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iti_g24_1/dummy_projects/ecommerce/helpers/kColors.dart';

import 'onboarding_screen2.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:
            const EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 50),
        child: Center(
          child: Column(
            children: [
              Container(
                  height: 300,
                  width: 300,
                  child: Image.asset("assets/images/onboarding1.png")),
              SizedBox(
                height: 20,
              ),
              Text(
                "Browse all the category",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "In aliquip aute exercitation ut et nisi ut mollit. Deserunt dolor elit pariatur aute .",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: KColors.greyColor,
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  Get.to(OnboardingScreen2());
                },
                child: Container(
                  height: 100,
                  child: Image.asset(
                    "assets/images/next1.png",
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
