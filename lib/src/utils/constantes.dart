import 'package:flutter/material.dart';

const colorDesabilitado = Color.fromRGBO(148, 148, 148, 1);
const colorPrincipal = Color(0xFF7F00FF);

final outlineInputBorder = OutlineInputBorder(
  borderRadius: const BorderRadius.all(Radius.circular(40)),
  borderSide: BorderSide(width: 1, color: Colors.grey[300]!),
);

const margenCamposFormulario = EdgeInsets.fromLTRB(0, 10, 0, 35);

final estiloHintInputs = TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.grey[300]);
const estiloLabelInputs = TextStyle(fontSize: 17, fontWeight: FontWeight.w300);

const Gradient gradientHabilitado = LinearGradient(
  colors: [
    Color(0xFF7F00FF),
    Color(0xFFE100FF),
  ],
);

const Gradient gradientDesabilitado = LinearGradient(
  colors: [
    colorDesabilitado,
    colorDesabilitado
  ],
);

const estiloTextoBoton = TextStyle(fontSize: 19, fontWeight: FontWeight.w400);

final divider = Divider(color: Colors.white.withOpacity(0.3), height: 1);