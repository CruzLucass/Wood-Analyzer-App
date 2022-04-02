import 'package:flutter/material.dart';

class InputFormWidget extends StatelessWidget {
  final String text;

  const InputFormWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 300,
      child: Form(
        child: TextFormField(
          decoration: InputDecoration(
            hintText: text,
            fillColor: const Color.fromARGB(255, 194, 146, 202),
            filled: true,
          ),
        ),
      ),
    );
  }
}
