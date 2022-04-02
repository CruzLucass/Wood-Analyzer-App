import 'package:flutter/material.dart';
import 'package:wood_analyzer/widgets/input_form_widget.dart';

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
            Container(
              width: 400,
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: const Text(
                'Entre com as informações do paciente.',
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
              children: [
                const InputFormWidget(text: 'Nome'),
                const InputFormWidget(text: 'Idade'),
                const InputFormWidget(text: 'Email'),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFA675A1),
                    fixedSize: const Size(300, 50),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: const Text(
                    'SALVAR',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
