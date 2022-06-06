// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:wood_analyzer/models/diagnostic.dart';
import 'package:wood_analyzer/utils/app_colors.dart';
import 'package:wood_analyzer/utils/dimensions.dart';

class DiagnosticImageScreen extends StatefulWidget {
  final String imagePath;
  const DiagnosticImageScreen({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

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
          Center(
            child: SizedBox(
              height: 250,
              width: double.infinity,
              child: InteractiveViewer(
                panEnabled: true, // Set it to false
                boundaryMargin: EdgeInsets.all(100),
                minScale: 0.5,
                maxScale: 2,
                child: Image.file(
                  File(widget.imagePath),
                ),
              ),
            ),
          ),
          Container(
            height: Dimensions.height50,
            decoration: BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(
                  width: 1,
                  color: AppColors.textColor,
                ),
              ),
              color: AppColors.lilasColor,
            ),
            child: Center(
              child: Text(
                'Selecione os diagnóticos da imagem: ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Dimensions.font16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: listDiagnostic.length,
              physics: ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      listDiagnostic[index].check =
                          !listDiagnostic[index].check;
                    });
                  },
                  child: Card(
                    elevation: 5,
                    child: ListTile(
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
                            listDiagnostic[index].check =
                                !listDiagnostic[index].check;
                          });
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
