// ignore_for_file: prefer_const_constructors, must_call_super

import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import 'package:wood_analyzer/controllers/pacient_controller.dart';
import 'package:wood_analyzer/models/pacient_model.dart';
import 'package:wood_analyzer/pdf_helper/mobile.dart';
import 'package:wood_analyzer/utils/dimensions.dart';
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
            SizedBox(
              height: Dimensions.height40,
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

                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Nome: ',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(data['name']),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Email: ',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(data['email']),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Celular: ',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(data['mobilephone']),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Idade: ',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(data['age'].toString()),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Fototipo: ',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(data['phototype']),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Tipo de pele: ',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(data['skinType']),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Mais Informações: ',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(data['moreInformation']),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Data da análise: ',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(f.format(dataFomatada)),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      const TitleWidget(
                        text: 'Diagnóticos da imagem',
                      ),
                    ],
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
            TextButton.icon(
              onPressed: () => _createPDF(widget.imagePath),
              icon: Icon(
                Icons.print,
              ),
              label: Text('Gerar PDF'),
            ),
          ],
        ),
      ),
    );
  }
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

Future<Uint8List> _readImageData(String name) async {
  File imagefile = File(name);
  final data = await imagefile.readAsBytes();
  return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
}
