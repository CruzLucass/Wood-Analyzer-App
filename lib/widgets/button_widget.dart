import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final String route;

  const ButtonWidget({Key? key, required this.text, required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: const Color(0xFFA675A1),
        fixedSize: const Size(300, 50),
      ),
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
