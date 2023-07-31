import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../intro/intro_screen.dart';
import '../utils/helper/pref_utils.dart';
import '../utils/helper/theme_manager.dart';
import 'dashboard/dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    init();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: ThemeManager.primaryColor,
        ),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Image.asset("assets/images/logo.png"),
        )) /* add child content here */,
      ),
    );
  }

  Future init() async {
    const _duration = Duration(milliseconds: 3000);
    return Timer(_duration, navigateToPage);
  }

  Future<void> navigateToPage() async {
    if (PrefUtils.getUserToken().isEmpty) {
      Get.offAll(Introscreen());
    } else {
     Get.offAll(DashboardScreen());
    }
  }
}
