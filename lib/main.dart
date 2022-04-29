import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wood_analyzer/routes/routes.dart';
import 'package:wood_analyzer/screens/analysis_info_screen.dart';
import 'package:wood_analyzer/screens/report_screen.dart';
import 'package:wood_analyzer/screens/home_screen.dart';
import 'package:wood_analyzer/screens/pacient_info_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wood Analyser',
      //home: SplashScreen(),
      initialRoute: Routes.getSplashPage(),
      getPages: Routes.routes,
    );
  }
}
