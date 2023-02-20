import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/screens/buscador/utility/buscador_utility.dart';
import 'package:prueba_tecnica/src/screens/inicio/bloc/inicio_bloc.dart';
import 'package:prueba_tecnica/src/utils/constantes.dart';

// Bloc
import 'package:prueba_tecnica/src/screens/buscador/bloc/buscador_bloc.dart';

class BuscadorWidget extends StatefulWidget {
  
  final BuscadorBloc buscadorBloc;
  final InicioBloc inicioBloc;

  const BuscadorWidget({
    Key? key,
    required this.buscadorBloc,
    required this.inicioBloc,
  }) : super(key: key);
  
  
  @override
  State<BuscadorWidget> createState() => _BuscadorWidgetState();
}

class _BuscadorWidgetState extends State<BuscadorWidget> {

  late TextEditingController _buscadorController;
  
  @override
  void initState() {
    super.initState();
    _buscadorController = widget.buscadorBloc.palabraClaveControllerValue;
    String? palabraClave = widget.buscadorBloc.palabraClaveValue;

    if (palabraClave != null) {
      _buscadorController.text = palabraClave;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          labelWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: size * 0.75,
                margin: margenCamposFormulario,
                child: TextField(
                  controller: _buscadorController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    enabledBorder: outlineInputBorder,
                    disabledBorder: outlineInputBorder,
                    errorBorder: outlineInputBorder,
                    focusedBorder: outlineInputBorder,
                    hintText: 'apple',
                    hintStyle: estiloHintInputs,
                  ),
                  onChanged: (String value) => widget.buscadorBloc.palabraClaveNext(value),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _obtenerNoticias();
                },
                child: Container(
                  width: 50,
                  height: 50,
                  margin: margenCamposFormulario,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: colorPrincipal
                  ),
                  child: const Center(
                    child: Icon(Icons.search, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget labelWidget() {
    return Row(
      children: const [
        Text(
          'Palabra clave',
          style: estiloLabelInputs
        ),
      ],
    );
  }

  Future<void> _obtenerNoticias() async {
    await BuscadorUtility.instance.obtenerNoticias(
      buscadorBloc: widget.buscadorBloc, inicioBloc: widget.inicioBloc);
  }
}