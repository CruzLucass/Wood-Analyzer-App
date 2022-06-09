// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:wood_analyzer/screens/analysis_info_screen.dart';
import 'package:wood_analyzer/screens/diagnostic_image.dart';
import 'package:wood_analyzer/screens/forgot_password_screen.dart';
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
  static const String forgotPassword = '/forgot_password';
  static const String initial = '/';
  static const String pacientInfo = '/pacient_info';
  static const String analysisInfo = '/analysis_info';
  static const String report = '/report';
  static const String diagnostic = '/diagnostic';

  static String getSplashPage() => splashPage;
  static String getLoginPage() => login;
  static String getSignupPage() => signup;
  static String getForgotPasswordPage() => forgotPassword;
  static String getInitial() => initial;
  static String getPacientInfo() => pacientInfo;
  static String getAnalysisInfo(String email) => '$analysisInfo?email=$email';
  static String getReportPage(String email, String imagePath) =>
      '$report?email=$email&imagepath=$imagePath';
  static String getDiagnosticPage(String imagePath, String email) =>
      '$diagnostic?imagepath=$imagePath&email=$email';

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(
      name: login,
      page: () => LoginScreen(),
      transition: Transition.upToDown,
    ),
    GetPage(
      name: signup,
      page: () {
        return SignupScreen();
      },
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: forgotPassword,
      page: () {
        return ForgotPasswordScreen();
      },
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: initial,
      page: () {
        return HomeScreen();
      },
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: pacientInfo,
      page: () {
        return PacientInfoScreen();
      },
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: analysisInfo,
      page: () {
        var email = Get.parameters['email'];
        return AnalysisInfoScreen(
          email: email!,
        );
      },
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: diagnostic,
      page: () {
        var imagePath = Get.parameters['imagepath'];
        var email = Get.parameters['email'];
        return DiagnosticImageScreen(
          imagePath: imagePath!,
          email: email!,
        );
      },
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: report,
      page: () {
        var imagePath = Get.parameters['imagepath'];
        var email = Get.parameters['email'];
        return ReportScreen(
          email: email!,
          imagePath: imagePath!,
        );
      },
      transition: Transition.rightToLeftWithFade,
    )
  ];
}
