import 'package:flutter/material.dart';
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
            const SizedBox(
              height: 40,
            ),
            Container(
              width: 300,
              height: 300,
              child: Image.network(
                'https://static-cse.canva.com/blob/759754/IMAGE1.jpg',
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            TextContainerWidget(
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
