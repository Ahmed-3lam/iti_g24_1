import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helpers/hive_helper.dart';
import 'main/main_screen.dart';
import 'onboarding/onboarding_screen1.dart';

bool isActive = true;

class SplashScreen extends StatefulWidget {
  final bool? secondSplash;
  const SplashScreen({this.secondSplash = false, super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;
  @override
  void initState() {
    const oneSec = Duration(milliseconds: 500);
    if (isActive) {
      timer = Timer.periodic(oneSec, (Timer t) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => SplashScreen(
                    secondSplash: !widget.secondSplash!,
                  )),
          (Route<dynamic> route) => false,
        );
      });
    }

    isActive = false;

    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!isActive) {
      timer!.cancel();
      print("==============" + HiveHelper.getToken().toString());
      if (HiveHelper.getToken() == null) {
        Future.delayed(Duration(seconds: 3))
            .then((v) => Get.offAll(() => OnboardingScreen()));
      } else {
        Future.delayed(Duration(seconds: 3))
            .then((v) => Get.offAll(() => MainScreen()));
      }
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.secondSplash! ? Colors.white : Colors.green,
      body: Center(
        child: Container(
          height: 100,
          width: 100,
          child: Image.asset(
            widget.secondSplash!
                ? "assets/images/logo2.png"
                : "assets/images/logo1.png",
            // height: 100,
            // width: 200,
          ),
        ),
      ),
    );
  }
}
