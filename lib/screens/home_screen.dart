import 'package:flutter/material.dart';
import 'package:wood_analyzer/utils/dimensions.dart';
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
        title: const Text('Wood Analyser'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: Dimensions.height160,
              width: Dimensions.width160,
              child: Image.asset(
                'images/logo1.png',
              ),
            ),
            SizedBox(
              height: Dimensions.height40,
            ),
            const TextContainerWidget(
              title: 'Descrição do Aplicativo',
              text:
                  'Informações sobre como vai funcionar o aplicativo e o relatório.',
            ),
            SizedBox(
              height: Dimensions.height40,
            ),
          ],
        ),
      ),
    );
  }
}
