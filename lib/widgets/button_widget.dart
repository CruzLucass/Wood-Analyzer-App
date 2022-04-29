import 'package:flutter/material.dart';
import 'package:wood_analyzer/utils/dimensions.dart';

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
        fixedSize: Size(
          Dimensions.width300,
          Dimensions.height50,
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      child: Text(
        text,
        style: TextStyle(
          fontSize: Dimensions.font20,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
