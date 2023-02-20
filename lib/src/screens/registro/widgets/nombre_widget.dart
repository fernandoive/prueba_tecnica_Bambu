import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/utils/constantes.dart';

// Bloc
import 'package:prueba_tecnica/src/screens/registro/bloc/registro_bloc.dart';

class NombreWidget extends StatefulWidget {
  
  final RegistroBloc registroBloc;

  const NombreWidget({
    Key? key,
    required this.registroBloc
  }) : super(key: key);
  
  
  @override
  State<NombreWidget> createState() => _NombreWidgetState();
}

class _NombreWidgetState extends State<NombreWidget> {

  late TextEditingController _nombreController;
  
  @override
  void initState() {
    super.initState();
    _nombreController = widget.registroBloc.nombreControllerValue;
    String? nombre = widget.registroBloc.nombreValue;

    if (nombre != null) {
      _nombreController.text = nombre;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        labelWidget(),
        Container(
          margin: margenCamposFormulario,
          child: TextField(
            controller: _nombreController,
            textCapitalization: TextCapitalization.words,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              enabledBorder: outlineInputBorder,
              disabledBorder: outlineInputBorder,
              errorBorder: outlineInputBorder,
              focusedBorder: outlineInputBorder,
              hintText: 'example',
              hintStyle: estiloHintInputs,
            ),
            onChanged: (String value) => widget.registroBloc.nombreNext(value),
          ),
        ),
      ],
    );
  }

  Widget labelWidget() {
    return Row(
      children: const [
        Text(
          'Nombre',
          style: estiloLabelInputs
        ),
      ],
    );
  }
}