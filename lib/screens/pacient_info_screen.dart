import 'package:flutter/material.dart';
import 'package:wood_analyzer/widgets/button_widget.dart';
import 'package:wood_analyzer/widgets/input_form_widget.dart';
import 'package:wood_analyzer/widgets/title_widget.dart';

class PacientInfoScreen extends StatefulWidget {
  const PacientInfoScreen({Key? key}) : super(key: key);

  @override
  _PacientInfoScreenState createState() => _PacientInfoScreenState();
}

class _PacientInfoScreenState extends State<PacientInfoScreen> {
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
              text: 'Entre com as informações do paciente.',
            ),
            const SizedBox(height: 40),
            Form(
              child: Column(
                children: const [
                  InputFormWidget(text: 'Nome', type: TextInputType.name),
                  InputFormWidget(text: 'Idade', type: TextInputType.number),
                  InputFormWidget(
                      text: 'Email', type: TextInputType.emailAddress),
                  SizedBox(
                    height: 40,
                  ),
                  ButtonWidget(text: 'SALVAR', route: '/analysis_info'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
