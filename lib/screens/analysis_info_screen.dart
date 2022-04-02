import 'package:flutter/material.dart';
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
              width: 400,
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: const Text(
                'Entre com as informações de análise.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFFA675A1),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Column(
              children: const [
                InputFormWidget(text: 'Tipo de Pele'),
                InputFormWidget(text: 'Fototipo'),
                InputFormWidget(text: 'Informações Adicionais'),
                SizedBox(
                  height: 40,
                ),
                ButtonWidget(text: 'CARREGAR IMAGEM', route: '/analysis'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
