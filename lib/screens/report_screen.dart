import 'dart:html';

import 'package:flutter/material.dart';
import 'package:wood_analyzer/utils/dimensions.dart';
import 'package:wood_analyzer/widgets/text_container_widget.dart';
import 'package:wood_analyzer/widgets/title_widget.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFFA675A1),
        title: const Text('Nome App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TitleWidget(
              text: 'RELATÓRIO DA ANÁLISE',
            ),
            SizedBox(
              height: Dimensions.height40,
            ),
            SizedBox(
              width: Dimensions.width300,
              height: Dimensions.height300,
              child: Image.asset(
                'images/logo1.jpg',
              ),
            ),
            SizedBox(
              height: Dimensions.height40,
            ),
            const TextContainerWidget(
              title: 'Descrição do Relatório',
              text:
                  'Aqui ficará o relatório com o resultado das análises e um overview das informações adicionadas.',
            ),
          ],
        ),
      ),
    );
  }
}
