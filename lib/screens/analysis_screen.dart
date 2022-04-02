import 'package:flutter/material.dart';
import 'package:wood_analyzer/widgets/button_widget.dart';
import 'package:wood_analyzer/widgets/input_form_widget.dart';
import 'package:wood_analyzer/widgets/title_widget.dart';

class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({Key? key}) : super(key: key);

  @override
  _AnalysisScreenState createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFFA675A1),
        title: const Text('Informações Paciente'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TitleWidget(
              text: 'Informações da Análise',
            ),
            const SizedBox(height: 40),
            Column(
              children: const [
                InputFormWidget(text: 'Tipo de Pele'),
                InputFormWidget(text: 'Fototipo'),
                SizedBox(
                  height: 40,
                ),
                ButtonWidget(text: 'CARREGAR IMAGEM', route: '/report'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
