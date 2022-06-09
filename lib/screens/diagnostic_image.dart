// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:wood_analyzer/controllers/pacient_controller.dart';
import 'package:wood_analyzer/models/diagnostic.dart';
import 'package:wood_analyzer/models/diagnostic_dto.dart';
import 'package:wood_analyzer/routes/routes.dart';
import 'package:wood_analyzer/utils/app_colors.dart';
import 'package:wood_analyzer/utils/dimensions.dart';

class DiagnosticImageScreen extends StatefulWidget {
  final String imagePath;
  final String email;
  const DiagnosticImageScreen({
    Key? key,
    required this.imagePath,
    required this.email,
  }) : super(key: key);

  @override
  State<DiagnosticImageScreen> createState() => _DiagnosticImageScreenState();
}

class _DiagnosticImageScreenState extends State<DiagnosticImageScreen> {
  int countListTile = 0;

  List<Diagnostic> listDiagnostic = [
    Diagnostic('Epiderme espessa', 'Branco fluorescente', false),
    Diagnostic('Células mortas', 'Pontos Brancos', false),
    Diagnostic('Saudável', 'Azul e Branco', false),
    Diagnostic('Fina e Desidratada', 'Violeta', false),
    Diagnostic('Desidratada', 'Violeta claro', false),
    Diagnostic('Muito hidratada', 'Fluorescente brilhante', false),
    Diagnostic('Pontos/ Mancha negra', 'Castanho', false),
    Diagnostic('Borbulhas e Acne', 'Amarelo e rosa', false),
  ];

  void _getAllDiagnostics() {
    List<DiagnosticDto> diags = [];
    for (var item in listDiagnostic) {
      if (item.check) {
        diags.add(
          DiagnosticDto(
            name: item.name,
            color: item.color,
          ),
        );
      }
    }

    PacientController().addDiagnosticToPacient(diags, widget.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: countListTile > 0
          ? FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => Center(
                    child: CircularProgressIndicator(),
                  ),
                );
                _getAllDiagnostics();
                Get.offNamed(
                  Routes.getReportPage(
                    widget.email,
                    widget.imagePath,
                  ),
                );
              },
              child: Icon(
                Icons.save,
                color: AppColors.mainColor,
              ),
              backgroundColor: AppColors.lightColor,
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
                'Selecione os diagnósticos da imagem: ',
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
                      listDiagnostic[index].check
                          ? countListTile++
                          : countListTile--;
                    });
                  },
                  child: Card(
                    elevation: 5,
                    child: ListTile(
                      title: Row(
                        children: [
                          Text(
                            'Diagnóstico: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            listDiagnostic[index].name,
                          ),
                        ],
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            'Cor: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            listDiagnostic[index].color,
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          listDiagnostic[index].check
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: AppColors.lilasColor,
                        ),
                        onPressed: () {
                          setState(() {
                            listDiagnostic[index].check =
                                !listDiagnostic[index].check;
                            listDiagnostic[index].check
                                ? countListTile++
                                : countListTile--;
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
