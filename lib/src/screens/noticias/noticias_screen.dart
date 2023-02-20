import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/screens/inicio/bloc/inicio_bloc.dart';
import 'package:prueba_tecnica/src/screens/noticias/bloc/noticias_bloc.dart';
import 'package:prueba_tecnica/src/screens/noticias/utility/noticias_utility.dart';
import 'package:prueba_tecnica/src/screens/noticias/widgets/categorias_widget.dart';
import 'package:prueba_tecnica/src/screens/noticias/widgets/lista_noticias_widget.dart';

class NoticiasScreen extends StatefulWidget {

  final InicioBloc inicioBloc;
  final NoticiasBloc noticiasBloc;

  const NoticiasScreen({
    Key? key,
    required this.inicioBloc,
    required this.noticiasBloc
  }) : super(key: key);

  @override
  State<NoticiasScreen> createState() => _NoticiasScreenState();
}

class _NoticiasScreenState extends State<NoticiasScreen> {


  @override
  void initState() {
    _obtenerNoticias();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _obtenerNoticias() async {
    await NoticiasUtility.instance.obtenerNoticiasTop(noticiasBloc: widget.noticiasBloc, inicioBloc: widget.inicioBloc);
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
    return CategoriasWidget(
      noticiasBloc: widget.noticiasBloc,
      inicioBloc: widget.inicioBloc,
    );
  }

  Widget _noiticias() {
    return ListaNoticiasWidget(noticiasBloc: widget.noticiasBloc,);
  }
}