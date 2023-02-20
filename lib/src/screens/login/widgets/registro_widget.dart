import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/utils/constantes.dart';

class RegistroWidget extends StatefulWidget {
  const RegistroWidget({Key? key}) : super(key: key);

  @override
  State<RegistroWidget> createState() => _RegistroWidgetState();
}

class _RegistroWidgetState extends State<RegistroWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              dividerWidget(),
              txtWidget(),
              dividerWidget(),
            ],
          ),
          labelWidget()
        ],
      ),
    );
  }

  Widget txtWidget() {
    return Text(
      'o',
      style: TextStyle(
        color: Colors.grey[200],
        fontSize: 25
      ),
    );
  }

  Widget dividerWidget() {
    final size = MediaQuery.of(context).size.width;
    return SizedBox(
      width: size * 0.38,
      child: Divider(
        height: 1,
        thickness: 1,
        color: Colors.grey[200],
      ),
    );
  }

  Widget labelWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/registro');
            },
            child: const Text(
              '¿Eres nuevo? Registrate',
              style: estiloLabelInputs
            ),
          ),
        ],
      ),
    );
  }
}