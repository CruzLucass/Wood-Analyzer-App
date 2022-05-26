import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wood_analyzer/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;

  late AnimationController controller;

  // Future<void> _loadResource() async {
  //   await Get.find<PopularProductController>().getPopularProductList();
  //   await Get.find<RecommendedProductController>().getRecommendedProductList();
  // }

  @override
  void initState() {
    super.initState();
    //_loadResource();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.bounceIn,
    );

    Timer(
      const Duration(seconds: 3),
      () => Get.offNamed(
        Routes.getInitial(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(
              child: Image.asset(
                'images/logo1.jpg',
                width: 200,
              ),
            ),
          ),
          const Center(
            child: Text(
              'Wood Analyser',
              style: TextStyle(
                fontFamily: 'Brush Script MT',
                fontSize: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
