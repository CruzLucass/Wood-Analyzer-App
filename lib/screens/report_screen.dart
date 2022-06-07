import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wood_analyzer/controllers/pacient_controller.dart';
import 'package:wood_analyzer/utils/dimensions.dart';
import 'package:wood_analyzer/widgets/text_container_widget.dart';
import 'package:wood_analyzer/widgets/title_widget.dart';

class ReportScreen extends StatefulWidget {
  final String email;
  const ReportScreen({Key? key, required this.email}) : super(key: key);

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
        title: const Text('Ralatório da Análise'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TitleWidget(
              text: 'Informações do paciente',
            ),
            SizedBox(
              height: Dimensions.height40,
            ),
            StreamBuilder(
              stream: PacientController().getInfoPacient(widget.email),
              builder:
                  (context, AsyncSnapshot<DocumentSnapshot?> streamSnapshot) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [Text(streamSnapshot.data!['name'])],
                    );
                  },
                );
              },
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
