import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/models/usuario_model.dart';
import 'package:prueba_tecnica/src/screens/buscador/buscador_screen.dart';
import 'package:prueba_tecnica/src/screens/inicio/bloc/inicio_bloc.dart';
import 'package:prueba_tecnica/src/screens/inicio/widgets/drawer_widget.dart';
import 'package:prueba_tecnica/src/screens/inicio/widgets/navigation_bar_widget.dart';
import 'package:prueba_tecnica/src/screens/noticias/noticias_screen.dart';
import 'package:prueba_tecnica/src/widgets/loading_circular_progress_widget.dart';
import 'package:sidebarx/sidebarx.dart';

class InicioScreen extends StatefulWidget {

  final UsuarioModel usuarioModel;

  const InicioScreen({
    Key? key,
    required this.usuarioModel
  }) : super(key: key);

  @override
  State<InicioScreen> createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen> {

  late InicioBloc _inicioBloc;

  int _selectedIndex = 0;
  String _tituloAppBar = 'Noticias';
   final _controller = SidebarXController(selectedIndex: 0, extended: false);

  @override
  initState() {
    _inicioBloc = InicioBloc();
    _inicioBloc.usuarioModelNext(widget.usuarioModel);
    super.initState();
  }

  @override
  void dispose() {
    _inicioBloc.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return LoadingCircularProgressWidget(
      streamMostrarCircularProgress: _inicioBloc.mostrarCircularProgress,
      child: Scaffold(
        drawer: DrawerWidget(controller: _controller, inicioBloc: _inicioBloc),
        appBar: AppBar(
          elevation: 0,
          title: Text(_tituloAppBar),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
          titleTextStyle: const TextStyle(color: Colors.black, fontSize: 18),
          
          backgroundColor: Colors.white,
        ),
        body: _pantallaSeleccionada(),
        bottomNavigationBar: NavigationBarWidget(
          selectedIndex: _selectedIndex,
          titulo: _titulo,
        ),
      ),
    );
  }

  Widget _pantallaSeleccionada() {
    List<Widget> pantallas = [
      NoticiasScreen(inicioBloc: _inicioBloc),
      BuscadorScreen(inicioBloc: _inicioBloc),
      const Center(
        child: Text('Perfil'),
      ),
    ];
    return pantallas[_selectedIndex];
  }

  void _titulo(int index) {
    setState(() {
      _selectedIndex = index;
      if(_selectedIndex == 0) {
        _tituloAppBar = 'Noticias';
      } else if(_selectedIndex == 1) {
        _tituloAppBar = 'Buscar';
      } else if(_selectedIndex == 2) {
        _tituloAppBar = 'Perfil';
      }
    });
  }
}