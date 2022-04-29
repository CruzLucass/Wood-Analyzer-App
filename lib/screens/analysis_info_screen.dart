// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wood_analyzer/utils/dimensions.dart';
import 'package:wood_analyzer/widgets/button_widget.dart';
import 'package:wood_analyzer/widgets/input_form_widget.dart';

class AnalysisInfoScreen extends StatefulWidget {
  const AnalysisInfoScreen({Key? key}) : super(key: key);

  @override
  _AnalysisInfoScreen createState() => _AnalysisInfoScreen();
}

class _AnalysisInfoScreen extends State<AnalysisInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFFA675A1),
        title: const Text('Informações Análise'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: Dimensions.width400,
              padding: EdgeInsets.only(
                right: Dimensions.padding20,
                left: Dimensions.padding20,
              ),
              child: Text(
                'Entre com as informações de análise.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: Dimensions.font20,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFFA675A1),
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height40,
            ),
            Column(
              children: [
                InputFormWidget(
                  text: 'Tipo de Pele',
                  type: TextInputType.text,
                ),
                InputFormWidget(
                  text: 'Fototipo',
                  type: TextInputType.text,
                ),
                InputFormWidget(
                  text: 'Informações Adicionais',
                  type: TextInputType.text,
                ),
                SizedBox(
                  height: Dimensions.height40,
                ),
                ButtonWidget(
                  text: 'CARREGAR IMAGEM',
                  route: '/report',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
