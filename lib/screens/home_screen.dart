import 'package:flutter/material.dart';
import 'package:wood_analyzer/widgets/button_widget.dart';
import 'package:wood_analyzer/widgets/text_container_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              height: 160,
              width: 160,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://lojashopfisio.vtexassets.com/arquivos/ids/263706-800-800?v=637482788020630000&width=800&height=800&aspect=true'),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const TextContainerWidget(
              title: 'Descrição do Aplicativo',
              text:
                  'Informações sobre como vai funcionar o aplicativo e o relatório.',
            ),
            const SizedBox(
              height: 40,
            ),
            const ButtonWidget(
              text: 'INICIAR',
              route: 'pacient_info',
            ),
          ],
        ),
      ),
    );
  }
}
