// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:wood_analyzer/routes/routes.dart';
import 'package:wood_analyzer/utils/app_colors.dart';
import 'package:wood_analyzer/utils/dimensions.dart';
import 'package:url_launcher/url_launcher.dart';

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
            child: Column(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  margin: EdgeInsets.only(
                    right: Dimensions.width300,
                    top: Dimensions.height20,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.login);
                    },
                    icon: Icon(
                      Icons.chevron_left_rounded,
                      color: Colors.black,
                      size: 40,
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 80,
                      width: 80,
                      child: Image.asset(
                        'images/logo1.png',
                      ),
                    ),
                    SizedBox(
                      height: 10,
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
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.fromLTRB(
                40,
                20,
                40,
                20,
              ),
              shrinkWrap: true,
              children: [
                const Text(
                  'O Wood Analyzer é um aplicativo com o objetivo de documentar diagnósticos de enfermidades na pele.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 10,
                ),
                const Text(
                  'Para utilizar, cadastre-se e faça o login com seu email e senha.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 10,
                ),
                const Text(
                  'Após realizar login você poderá cadastrar seu cliente com as informações pessoais dele.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 10,
                ),
                const Text(
                  'Você também deve inserir informações sobre o tipo da pele do seu paciente.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 10,
                ),
                const Text(
                  'Depois de salvar as informações, selecione uma foto da sua galeria ou se preferir tire a foto da lâmpada de wood no momento do cadastro.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 10,
                ),
                const Text(
                  'Após isso, será listado os possíveis diagnóticos da foto filtrada pela lâmpada. Selecione os diagnóticos  aparentes na foto.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 10,
                ),
                const Text(
                  'Clique em salvar para ver todas as informações do seu paciente e caso seja necessário gere o pdf para comparações.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 40,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Desenvolvido por',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        decoration: TextDecoration.underline,
                        shadows: const <Shadow>[
                          Shadow(
                            offset: Offset(2, 2),
                            blurRadius: 3.0,
                            color: Color.fromARGB(100, 0, 0, 0),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              child: Icon(
                                FontAwesomeIcons.linkedin,
                                color: AppColors.lightColor,
                                size: 35,
                              ),
                              onTap: () => launchUrl(
                                Uri.parse(
                                    'https://www.linkedin.com/in/lucas-cruzz/'),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                'Lucas Cruz',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  shadows: const <Shadow>[
                                    Shadow(
                                      offset: Offset(2, 2),
                                      blurRadius: 3.0,
                                      color: Color.fromARGB(100, 0, 0, 0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              child: Icon(
                                FontAwesomeIcons.linkedin,
                                color: AppColors.lightColor,
                                size: 35,
                              ),
                              onTap: () => launchUrl(
                                Uri.parse(
                                    'https://www.linkedin.com/in/matheus-fidelis/'),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                'Matheus Fidelis',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  shadows: const <Shadow>[
                                    Shadow(
                                      offset: Offset(2, 2),
                                      blurRadius: 3.0,
                                      color: Color.fromARGB(100, 0, 0, 0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              child: Icon(
                                FontAwesomeIcons.linkedin,
                                color: AppColors.lightColor,
                                size: 35,
                              ),
                              onTap: () => launchUrl(
                                Uri.parse(
                                    'https://www.linkedin.com/in/leonardo-garroni'),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                'Leonardo Garroni',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  shadows: const <Shadow>[
                                    Shadow(
                                      offset: Offset(2, 2),
                                      blurRadius: 3.0,
                                      color: Color.fromARGB(100, 0, 0, 0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
