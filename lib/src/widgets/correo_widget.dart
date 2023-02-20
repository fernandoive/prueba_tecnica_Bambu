import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/utils/constantes.dart';

class CorreoWidget extends StatefulWidget {
  const CorreoWidget({
    Key? key,
    required this.correoController,
    required this.correoValue,
    required this.correoStream,
    required this.correoNext,
  }) : super(key: key);

  final TextEditingController correoController;
  final String? correoValue;
  final Stream<String> correoStream;
  final Function(String) correoNext;
  @override
  State<CorreoWidget> createState() => _CorreoWidgetState();
}

class _CorreoWidgetState extends State<CorreoWidget> {

  late TextEditingController _correoController;

  @override
  void initState() {
    super.initState();

    _correoController = widget.correoController;
    String? correo = widget.correoValue;

    if (correo != null) {
      _correoController.text = correo;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: widget.correoStream,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        
        return Column(
          children: [
            labelWidget(),
            Container(
              margin: margenCamposFormulario,
              child: TextField(
                controller: _correoController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  enabledBorder: outlineInputBorder,
                  disabledBorder: outlineInputBorder,
                  errorBorder: outlineInputBorder,
                  focusedBorder: outlineInputBorder,
                  hintText: 'example@email.com',
                  hintStyle: estiloHintInputs,
                ),
                onChanged: (String value) => widget.correoNext(value),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget labelWidget() {
    return Row(
      children: const [
        Text(
          'Correo electronico',
          style: estiloLabelInputs
        ),
      ],
    );
  }
}