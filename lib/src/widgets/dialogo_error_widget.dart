import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

Future<void> dialogError(
  BuildContext context,
  String mensaje
) async {
  Dialogs.materialDialog(
    msg: mensaje,
    title: "Error",
    msgAlign: TextAlign.center,
    color: Colors.white,
    context: context,
    actions: [
      IconsOutlineButton(
        onPressed: () {
          Navigator.pop(context);
        },
        text: 'Cerrar',
        iconData: Icons.cancel_outlined,
        textStyle: const TextStyle(color: Colors.grey),
        iconColor: Colors.grey,
      ),
    ]
  );
}