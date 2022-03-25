import 'package:flutter/material.dart';

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
                    'Descrição do Aplicativo',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Informações sobre como vai funcionar o aplicativo e o relatório.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFFA675A1),
                fixedSize: const Size(250, 50),
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'pacient_info');
              },
              child: const Text(
                'INICIAR',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
