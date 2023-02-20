import 'package:flutter/material.dart';

class TextoBienvenidaWidget extends StatefulWidget {
  const TextoBienvenidaWidget({Key? key}) : super(key: key);

  @override
  State<TextoBienvenidaWidget> createState() => _TextoBienvenidaWidgetState();
}

class _TextoBienvenidaWidgetState extends State<TextoBienvenidaWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Padding(
          padding: EdgeInsets.only(bottom: 30),
          child: Text(
            'Bienvenido',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35
            ),
          ),
        ),
      ],
    );
  }
}