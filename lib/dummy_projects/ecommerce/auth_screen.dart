import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iti_g24_1/dummy_projects/ecommerce/kColors.dart';
import 'package:iti_g24_1/dummy_projects/ecommerce/login/login_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late Timer timer;
  int num1 = 1;
  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (num1 == 1) {
        num1 = 2;
      } else {
        num1 = 1;
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height,
            child: Image.asset(
              "assets/images/background$num1.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 100.0, left: 20, bottom: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome to our",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF16162E),
                  ),
                ),
                Text(
                  "our E-Grocery",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: KColors.primaryColor,
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Get.to(LoginScreen());
                  },
                  child: Container(
                    height: 56,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: KColors.primaryColor),
                    child: Center(
                      child: Text(
                        "Continue with Email or Phone",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 56,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: Center(
                    child: Text(
                      "Create an account",
                      style: TextStyle(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
