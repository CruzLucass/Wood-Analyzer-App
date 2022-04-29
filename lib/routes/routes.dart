import 'package:get/get.dart';
import 'package:wood_analyzer/screens/analysis_info_screen.dart';
import 'package:wood_analyzer/screens/home_screen.dart';
import 'package:wood_analyzer/screens/pacient_info_screen.dart';
import 'package:wood_analyzer/screens/report_screen.dart';
import 'package:wood_analyzer/screens/splash/splash_screen.dart';

class Routes {
  static const String splashPage = '/splash-page';
  static const String initial = '/';
  static const String pacientInfo = '/pacient_info';
  static const String analysisInfo = '/analysis_info';
  static const String report = '/report';

  static String getSplashPage() => '$splashPage';
  static String getInitial() => '$initial';
  static String getPacientInfo() => '$pacientInfo';
  static String getAnalysisInfo() => '$analysisInfo';
  static String getReportPage() => '$report';

// static String getPacientInfo(int pageId, String page) =>
//       '$pacientInfo?pageId=$pageId&page=$page';
//   static String getAnalysisInfo(int pageId, String page) =>
//       '$analysisInfo?pageId=$pageId&page=$page';
//   static String getReportPage() => '$report';

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(
      name: initial,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: pacientInfo,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return PacientInfoScreen();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: analysisInfo,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return AnalysisInfoScreen();
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
