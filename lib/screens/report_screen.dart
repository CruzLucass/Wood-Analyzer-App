import 'package:flutter/material.dart';

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
            Container(
              width: 400,
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: const Text(
                'RELATÓRIO DA ANÁLISE',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFFA675A1),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 300,
              height: 300,
              child: Image.network(
                'https://static-cse.canva.com/blob/759754/IMAGE1.jpg',
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: 250,
              height: 200,
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              color: const Color(0xFFF7DEFF),
              child: Column(
                children: const [
                  Text(
                    'Descrição do Relatório',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Aqui ficará o relatório com o resultado das análises e um overview das informações adicionadas.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
