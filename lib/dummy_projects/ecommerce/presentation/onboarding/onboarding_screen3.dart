import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iti_g24_1/dummy_projects/ecommerce/helpers/kColors.dart';
import 'package:iti_g24_1/dummy_projects/ecommerce/presentation/auth_screen.dart';

class OnboardingScreen3 extends StatefulWidget {
  const OnboardingScreen3({super.key});

  @override
  State<OnboardingScreen3> createState() => _OnboardingScreen3State();
}

class _OnboardingScreen3State extends State<OnboardingScreen3> {
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
                  child: Image.asset("assets/images/onboarding3.png")),
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
                  Get.offAll(AuthScreen());
                },
                child: Container(
                  height: 100,
                  child: Image.asset(
                    "assets/images/next3.png",
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
