import 'package:flutter/material.dart';
import 'package:wood_analyzer/utils/dimensions.dart';

class TitleWidget extends StatelessWidget {
  final String text;

  const TitleWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.width400,
      padding: EdgeInsets.only(
        right: Dimensions.padding20,
        left: Dimensions.padding20,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: Dimensions.font20,
          fontWeight: FontWeight.w900,
          color: const Color(0xFFA675A1),
        ),
      ),
    );
  }
}
