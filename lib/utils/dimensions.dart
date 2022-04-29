import 'package:get/get.dart';

class Dimensions {
  //844 é a tela padrao do iphone 12 - com isso dividimos pelas alturas que queriamos
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  //list view size - width is 390 when 390 / 120
  static double listViewImgSize = screenWidth / 3.25;
  static double listViewTextContSize = screenWidth / 3.9;

  //espaço pradrão
  static double height20 = screenHeight / 42.2;
  static double height40 = screenHeight / 21.1;
  static double height50 = screenHeight / 16.88;
  static double height160 = screenHeight / 5.275;
  static double height200 = screenHeight / 4.22;
  static double height300 = screenHeight / 2.813;

  //Width
  static double width400 = screenWidth / 0.975;
  static double width300 = screenWidth / 1.3;
  static double width250 = screenWidth / 1.56;
  static double width160 = screenWidth / 2.4375;

  //padding
  static double padding20 = screenHeight / 42.2;
  static double padding15 = screenHeight / 56.26;

  //fonts
  static double font16 = screenHeight / 52.75;
  static double font20 = screenHeight / 42.2;
}
