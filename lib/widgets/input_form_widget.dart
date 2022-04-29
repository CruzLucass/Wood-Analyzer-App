import 'package:flutter/material.dart';
import 'package:wood_analyzer/utils/dimensions.dart';

class InputFormWidget extends StatelessWidget {
  final String text;
  final TextInputType type;

  const InputFormWidget({
    Key? key,
    required this.text,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: Dimensions.width300,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: text,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 194, 146, 202),
              width: 1,
            ),
          ),
          filled: true,
        ),
        keyboardType: type,
      ),
    );
  }
}
