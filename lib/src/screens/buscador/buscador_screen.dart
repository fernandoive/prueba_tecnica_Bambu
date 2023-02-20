import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/screens/buscador/bloc/buscador_bloc.dart';
import 'package:prueba_tecnica/src/screens/buscador/widgets/buscador_widget.dart';
import 'package:prueba_tecnica/src/screens/buscador/widgets/lista_noticias_widget.dart';
import 'package:prueba_tecnica/src/screens/inicio/bloc/inicio_bloc.dart';

class BuscadorScreen extends StatefulWidget {

  final InicioBloc inicioBloc;

  const BuscadorScreen({
    Key? key,
    required this.inicioBloc
  }) : super(key: key);

  @override
  State<BuscadorScreen> createState() => _BuscadorScreenState();
}

class _BuscadorScreenState extends State<BuscadorScreen> {

  late BuscadorBloc _buscadorBloc;

  @override
  void initState() {
    _buscadorBloc = BuscadorBloc();
    super.initState();
  }

  @override
  void dispose() {
    _buscadorBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

    Widget _body() {
    final size = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Center(
        child: SizedBox(
          width: size * 0.9,
          child: Column(
            children: [
              _categorias(),
              _noiticias()
            ],
          ),
        ),
      ),
    );
  }

  Widget _categorias() {
    return BuscadorWidget(
      buscadorBloc: _buscadorBloc,
      inicioBloc: widget.inicioBloc,
    );
  }

  Widget _noiticias() {
    return ListaNoticiasWidget(buscadorBloc: _buscadorBloc,);
  }
}