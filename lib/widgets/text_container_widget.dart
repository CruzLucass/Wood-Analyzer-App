import 'package:flutter/material.dart';
import 'package:wood_analyzer/utils/dimensions.dart';

class TextContainerWidget extends StatelessWidget {
  final String title;
  final String text;

  const TextContainerWidget({
    Key? key,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.width250,
      height: Dimensions.height200,
      padding: EdgeInsets.only(
        left: Dimensions.padding15,
        right: Dimensions.padding15,
      ),
      color: const Color(0xFFF7DEFF),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: Dimensions.font20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: Dimensions.height20),
          Text(
            text,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: Dimensions.font16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
