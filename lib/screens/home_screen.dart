// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wood_analyzer/routes/routes.dart';
import 'package:wood_analyzer/utils/app_colors.dart';
import 'package:wood_analyzer/utils/dimensions.dart';
import 'package:wood_analyzer/widgets/button_widget.dart';
import 'package:wood_analyzer/widgets/text_container_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.lilasColor,
        title: const Text('Seja Bem-vindo!'),
        leading: IconButton(
          onPressed: () {
            Get.offNamed(Routes.login);
          },
          icon: Icon(
            Icons.chevron_left_rounded,
            size: 30,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: Dimensions.height160,
              width: Dimensions.width160,
              child: Image.asset(
                'images/logo1.png',
              ),
            ),
            SizedBox(
              height: Dimensions.height40,
            ),
            const TextContainerWidget(
              title: 'Descrição do Aplicativo',
              text:
                  'Informações sobre como vai funcionar o aplicativo e o relatório.',
            ),
            SizedBox(
              height: Dimensions.height40,
            ),
          ],
        ),
      ),
    );
  }
}
