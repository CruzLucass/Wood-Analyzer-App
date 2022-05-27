// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:wood_analyzer/screens/analysis_info_screen.dart';
import 'package:wood_analyzer/screens/diagnostic_image.dart';
import 'package:wood_analyzer/screens/home_screen.dart';
import 'package:wood_analyzer/screens/login_screen.dart';
import 'package:wood_analyzer/screens/pacient_info_screen.dart';
import 'package:wood_analyzer/screens/report_screen.dart';
import 'package:wood_analyzer/screens/signup_screen.dart';
import 'package:wood_analyzer/screens/splash/splash_screen.dart';

class Routes {
  static const String splashPage = '/splash-page';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String initial = '/';
  static const String pacientInfo = '/pacient_info';
  static const String analysisInfo = '/analysis_info';
  static const String report = '/report';
  static const String diagnostic = '/diagnostic';


  static String getSplashPage() => splashPage;
  static String getLoginPage() => login;
  static String getSignupPage() => signup;
  static String getInitial() => initial;
  static String getPacientInfo() => pacientInfo;
  static String getAnalysisInfo() => analysisInfo;
  static String getReportPage() => report;
  static String getDiagnosticPage() => diagnostic;

// static String getPacientInfo(int pageId, String page) =>
//       '$pacientInfo?pageId=$pageId&page=$page';
//   static String getAnalysisInfo(int pageId, String page) =>
//       '$analysisInfo?pageId=$pageId&page=$page';
//   static String getReportPage() => '$report';

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(
      name: login,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: signup,
      page: () {
        return SignupScreen();
      },
    ),
    GetPage(
      name: initial,
      page: () {
        return HomeScreen();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: pacientInfo,
      page: () {
        return PacientInfoScreen();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: analysisInfo,
      page: () {
        return AnalysisInfoScreen();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: diagnostic,
      page: () {
        return DiagnosticImageScreen();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: report,
      page: () {
        return ReportScreen();
      },
      transition: Transition.fadeIn,
    )
  ];
}
