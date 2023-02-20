import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/screens/inicio/bloc/inicio_bloc.dart';
import 'package:prueba_tecnica/src/screens/login/login_screen.dart';
import 'package:prueba_tecnica/src/utils/constantes.dart';
import 'package:sidebarx/sidebarx.dart';

class DrawerWidget extends StatefulWidget {
  
  final SidebarXController controller;
  final InicioBloc inicioBloc;
  
  const DrawerWidget({
    Key? key,
    required SidebarXController controller,
    required this.inicioBloc,
  })  : controller = controller, super(key: key);
  

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: widget.controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        textStyle: const TextStyle(color: Colors.black),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200],
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: colorPrincipal,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        selectedTextStyle: TextStyle(color: colorPrincipal, fontWeight: FontWeight.bold),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return Column(
          children: [
            extended ? FittedBox(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 100),
                child: Text(
                  widget.inicioBloc.usuarioModelValue!.nombre,
                  style: const TextStyle(
                    color: Colors.black
                  ),
                ),
              ),
            ) : const SizedBox()
          ],
        );
      }, 
      items: [
        SidebarXItem(
          icon: Icons.exit_to_app,
          label: 'Cerrar Sesión',
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (BuildContext context) => const LoginScreen()),
              ModalRoute.withName('/')
            );
          },
        ),
      ],
    );
  }
}

