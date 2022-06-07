// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:wood_analyzer/models/diagnostic.dart';
import 'package:wood_analyzer/utils/app_colors.dart';
import 'package:wood_analyzer/utils/dimensions.dart';

import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:wood_analyzer/pdf_helper/mobile.dart';

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
  int countListTile = 0;

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
      floatingActionButton: countListTile > 0
          ? FloatingActionButton(
              onPressed: () => _createPDF(widget.imagePath),
              child: Icon(Icons.print),
              tooltip: 'Finalizar',
            )
          : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFFA675A1),
        title: const Text('Diagnóstico da imagem'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: Dimensions.height400,
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
                      listDiagnostic[index].check = !listDiagnostic[index].check;
                      listDiagnostic[index].check ? countListTile++ : countListTile--;
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
                          listDiagnostic[index].check ? Icons.check_box : Icons.check_box_outline_blank,
                        ),
                        onPressed: () {
                          setState(() {
                            listDiagnostic[index].check = !listDiagnostic[index].check;
                            listDiagnostic[index].check ? countListTile++ : countListTile--;
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

  Future<void> _createPDF(String imagePath) async {
    PdfDocument document = PdfDocument();
    final page = document.pages.add();

    page.graphics.drawString(
      'Welcome to PDF Successful',
      PdfStandardFont(PdfFontFamily.helvetica, 30),
    );

    page.graphics.drawImage(
      PdfBitmap(
        await _readImageData(imagePath),
      ),
      Rect.fromLTWH(0, 100, 440, 550),
    );

    List<int> bytes = document.save();
    document.dispose();

    saveAndLaunchFile(bytes, 'Output.pdf');
  }
}

Future<Uint8List> _readImageData(String name) async {
  File imagefile = File(name);
  final data = await imagefile.readAsBytes();
  return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
}
