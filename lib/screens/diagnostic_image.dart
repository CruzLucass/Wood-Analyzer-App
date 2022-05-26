import 'package:flutter/material.dart';
import 'package:wood_analyzer/models/diagnostic.dart';

class DiagnosticImageScreen extends StatefulWidget {
  const DiagnosticImageScreen({Key? key}) : super(key: key);

  @override
  State<DiagnosticImageScreen> createState() => _DiagnosticImageScreenState();
}

class _DiagnosticImageScreenState extends State<DiagnosticImageScreen> {
  List<Diagnostic> listDiagnostic = [
    Diagnostic('Epiderme espessa', 'Branco fluorescente', false),
    Diagnostic('Células mortas', 'Pontos Brancos', false),
    Diagnostic('Pele saudável', 'Azul e Branco', false),
    Diagnostic('Pele fina e desidratada', 'Violeta', false),
    Diagnostic('Pele desidratada', 'Violeta claro', false),
    Diagnostic('Pele muito hidratada', 'Fluorescente brilhante', false),
    Diagnostic('Ponto negro/ Mancha negra', 'Castanho', false),
    Diagnostic('Borbulhas e acne', 'Amarelo e rosa', false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFFA675A1),
        title: const Text('Diagnóstico da imagem'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 400,
            color: Colors.grey,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
      bottomSheet: ListView.builder(
        itemCount: listDiagnostic.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Container(
              child: Text(
                'Diagnótico: ${listDiagnostic[index].name}',
              ),
            ),
            subtitle: Container(
              child: Text(
                'Cor: ${listDiagnostic[index].color}',
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                listDiagnostic[index].check
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
              ),
              onPressed: () {
                setState(() {
                  listDiagnostic[index].check = !listDiagnostic[index].check;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
