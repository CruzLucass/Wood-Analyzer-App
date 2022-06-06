// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:wood_analyzer/routes/routes.dart';
import 'package:wood_analyzer/utils/app_colors.dart';
import 'package:wood_analyzer/utils/dimensions.dart';
import 'package:wood_analyzer/widgets/button_widget.dart';
import 'package:wood_analyzer/widgets/text_container_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lilasColor,
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
      body: Column(
        children: [
          Container(
            height: Dimensions.height300,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(90),
              ),
            ),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: Dimensions.height160,
                    width: Dimensions.width160,
                    child: Image.asset(
                      'images/logo1.png',
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      'Sobre',
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: const Text(
                    'O Wood Analyzer é um aplicativo com o objetivo de documentar diagnósticos para doenças na pele. Para utilizar, cadastre-se e faça o login com a sua conta. Após isso preencha os campos com as informações do paciente. Agora você terá que selecionar a imagem ou tirar uma nova para que seja analisada. Preencha os campos com as informações da pele do paciente. Agora podemos fazer a análise, selecione as opções do diagnóstico.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        height: 50,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  child: Icon(
                    FontAwesomeIcons.linkedin,
                    color: AppColors.mainColor,
                    size: 35,
                  ),
                  onTap: () => launchUrl(
                    Uri.parse('https://www.linkedin.com/in/lucas-cruzz/'),
                  ),
                ),
              ],
            ),
            InkWell(
              child: Icon(
                FontAwesomeIcons.linkedin,
                color: AppColors.mainColor,
                size: 35,
              ),
              onTap: () => launchUrl(
                Uri.parse('https://www.linkedin.com/in/matheus-fidelis/'),
              ),
            ),
            InkWell(
              child: Icon(
                FontAwesomeIcons.linkedin,
                color: AppColors.mainColor,
                size: 35,
              ),
              onTap: () => launchUrl(
                Uri.parse('https://www.linkedin.com/in/leonardo-garroni'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
