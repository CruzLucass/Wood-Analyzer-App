// ignore_for_file: prefer_const_constructors, must_call_super

import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:wood_analyzer/models/diagnostic_dto.dart';
import 'package:wood_analyzer/models/pacient_model.dart';
import 'package:wood_analyzer/pdf_helper/mobile.dart';
import 'package:wood_analyzer/routes/routes.dart';
import 'package:wood_analyzer/utils/app_colors.dart';
import 'package:wood_analyzer/widgets/title_widget.dart';

class ReportScreen extends StatefulWidget {
  final String email;
  final String imagePath;
  const ReportScreen({
    Key? key,
    required this.email,
    required this.imagePath,
  }) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  Map<String, dynamic>? data;
  var collection = FirebaseFirestore.instance.collection('pacient');
  PacientModel? pacient;
  var dataForm = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFFA675A1),
        title: const Text('Ralatório da Análise'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            const TitleWidget(
              text: 'Informações do paciente',
            ),
            FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              future: collection.doc(widget.email).get(),
              builder: (_, snapshot) {
                if (snapshot.hasError) return Text('Error = ${snapshot.error}');

                if (snapshot.hasData) {
                  var data = snapshot.data!.data();
                  Timestamp t = data!['date'];
                  DateTime dataFomatada = t.toDate();
                  final f = DateFormat('dd-MM-yyy hh:mm');

                  List<DiagnosticDto> diagnostics = [];
                  for (var item in data['diagnostics']) {
                    diagnostics.add(
                      DiagnosticDto(
                        name: item['name'].toString(),
                        color: item['color'].toString(),
                      ),
                    );
                  }

                  pacient = PacientModel(
                    name: data['name'],
                    email: data['email'],
                    age: data['age'],
                    mobilephone: data['mobilephone'],
                    phototype: data['phototype'],
                    skinType: data['skinType'],
                    moreInformation: data['moreInformation'],
                    professional: data['professional'],
                    diagnostics: diagnostics,
                  );

                  dataForm = f.format(dataFomatada);

                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Wrap(
                            children: [
                              Text(
                                'Nome: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                data['name'],
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Wrap(
                            children: [
                              Text(
                                'Email: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                data['email'],
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Celular: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                data['mobilephone'],
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Idade: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                data['age'].toString(),
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Fototipo: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                data['phototype'],
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Tipo de pele: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                data['skinType'],
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Wrap(
                            children: [
                              Text(
                                'Mais Informações: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                data['moreInformation'],
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Data da análise: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                f.format(dataFomatada),
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        const TitleWidget(
                          text: 'Diagnóticos da imagem',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: pacient!.diagnostics!.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Diagnótico: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        pacient!.diagnostics![index].name,
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Cor: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        pacient!.diagnostics![index].color,
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Wrap(
                            children: [
                              Text(
                                'Email Esteticista: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                data['professional'],
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TitleWidget(text: 'Imagem')
                      ],
                    ),
                  );
                }

                return Center(child: CircularProgressIndicator());
              },
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                height: 250,
                width: double.infinity,
                child: Image.file(
                  File(widget.imagePath),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Get.offNamed(Routes.pacientInfo);
                  },
                  icon: Icon(
                    Icons.repeat,
                  ),
                  label: Text('Voltar'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    primary: AppColors.lilasColor,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () =>
                      _createPDF(widget.imagePath, pacient!, dataForm),
                  icon: Icon(
                    Icons.print,
                  ),
                  label: Text('Gerar PDF'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    primary: AppColors.mainColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _createPDF(
    String imagePath, PacientModel pacient, String dataFormatada) async {
  final pdf = pw.Document();

  final image = pw.MemoryImage(
    File(imagePath).readAsBytesSync(),
  );

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return [
          pw.Center(
            child: pw.Column(
              children: [
                pw.Text(
                  'Relatório Wood Analyzer',
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
                pw.SizedBox(
                  height: 30,
                ),
                pw.Text(
                  'Informações do paciente',
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                pw.SizedBox(
                  height: 20,
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.only(left: 20),
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Nome: ',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      pw.Text(
                        pacient.name,
                        style: pw.TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.only(left: 20),
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Email: ',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      pw.Text(
                        pacient.email,
                        style: pw.TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.only(left: 20),
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Celular: ',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      pw.Text(
                        pacient.mobilephone,
                        style: pw.TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.only(left: 20),
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Idade: ',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      pw.Text(
                        pacient.age.toString(),
                        style: pw.TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.only(left: 20),
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Fototipo: ',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      pw.Text(
                        pacient.phototype!,
                        style: pw.TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.only(left: 20),
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Tipo de pele: ',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      pw.Text(
                        pacient.skinType!,
                        style: pw.TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.only(left: 20),
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Mais Informações: ',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      pw.Text(
                        pacient.moreInformation!,
                        style: pw.TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.only(left: 20),
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Data da análise: ',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      pw.Text(
                        dataFormatada,
                        style: pw.TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(
                  height: 20,
                ),
                pw.Text(
                  'Diagnóticos da imagem',
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                pw.SizedBox(
                  height: 20,
                ),
                pw.ListView.builder(
                    itemCount: pacient.diagnostics!.length,
                    itemBuilder: (context, index) {
                      return pw.Column(
                        children: [
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(left: 20),
                            child: pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              children: [
                                pw.Text(
                                  'Diagnótico: ',
                                  style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                pw.Text(
                                  pacient.diagnostics![index].name,
                                  style: pw.TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(left: 20),
                            child: pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              children: [
                                pw.Text(
                                  'Cor: ',
                                  style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                pw.Text(
                                  pacient.diagnostics![index].color,
                                  style: pw.TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          pw.SizedBox(
                            height: 20,
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(left: 20),
                            child: pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              children: [
                                pw.Text(
                                  'Email Esteticista: ',
                                  style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                pw.Text(
                                  pacient.professional!,
                                  style: pw.TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
                pw.SizedBox(
                  height: 50,
                ),
                pw.Text(
                  'Imagem',
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Container(
                  height: 500,
                  width: double.infinity,
                  child: pw.Image(
                    image,
                  ),
                ),
              ],
            ),
          ),
        ];
      },
    ),
  );
  final appDocDir = await getApplicationDocumentsDirectory();
  final appDocPath = appDocDir.path;
  final file = File(appDocPath + '/' + '${pacient.name}.pdf');
  //await file.writeAsBytes(await pdf.save());
  await file.writeAsBytes(await pdf.save());
  await OpenFile.open(file.path);
}

// Future<void> _createPDF(
//     String imagePath, PacientModel pacient, String dataFormatada) async {
//   PdfDocument document = PdfDocument();
//   document.pageSettings.setMargins(4);
//   final page = document.pages.add();

//   page.graphics.drawString(
//     'Wood Analyser',
//     PdfStandardFont(PdfFontFamily.helvetica, 30),
//   );

//   page.graphics.drawString(
//     'Informações do Paciente',
//     PdfStandardFont(PdfFontFamily.helvetica, 24),
//   );

//   page.graphics.drawString(
//     'Nome: ${pacient.name}',
//     PdfStandardFont(PdfFontFamily.helvetica, 20),
//   );
//   page.graphics.drawString(
//     'Email: ${pacient.email}',
//     PdfStandardFont(PdfFontFamily.helvetica, 20),
//   );
//   page.graphics.drawString(
//     'Celular: ${pacient.mobilephone}',
//     PdfStandardFont(PdfFontFamily.helvetica, 20),
//   );
//   page.graphics.drawString(
//     'Idade: ${pacient.age}',
//     PdfStandardFont(PdfFontFamily.helvetica, 20),
//   );
//   page.graphics.drawString(
//     'Fototipo: ${pacient.phototype}',
//     PdfStandardFont(PdfFontFamily.helvetica, 20),
//   );
//   page.graphics.drawString(
//     'Tipo de Pele: ${pacient.skinType}',
//     PdfStandardFont(PdfFontFamily.helvetica, 20),
//   );
//   page.graphics.drawString(
//     'Informações adicionais: ${pacient.moreInformation}',
//     PdfStandardFont(PdfFontFamily.helvetica, 20),
//   );
//   page.graphics.drawString(
//     'Data cadastro: $dataFormatada',
//     PdfStandardFont(PdfFontFamily.helvetica, 20),
//   );

//   page.graphics.drawString(
//     'Diagnósticos da imagem',
//     PdfStandardFont(PdfFontFamily.helvetica, 24),
//   );

//   page.graphics.drawString(
//     'Diagnósticos: ${pacient.diagnostics!.map((e) => e.name).toString()}',
//     PdfStandardFont(PdfFontFamily.helvetica, 20),
//   );

//   page.graphics.drawString(
//     'Imagem:',
//     PdfStandardFont(PdfFontFamily.helvetica, 24),
//   );

//   page.graphics.drawImage(
//     PdfBitmap(
//       await _readImageData(imagePath),
//     ),
//     Rect.fromLTWH(0, 100, 440, 550),
//   );

//   List<int> bytes = document.save();
//   document.dispose();

//   saveAndLaunchFile(bytes, '${pacient.name}.pdf');
// }

Future<Uint8List> _readImageData(String name) async {
  File imagefile = File(name);
  final data = await imagefile.readAsBytes();
  return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
}
