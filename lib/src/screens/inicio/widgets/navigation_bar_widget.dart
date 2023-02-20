import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/utils/constantes.dart';

class NavigationBarWidget extends StatefulWidget {
  
  int selectedIndex;
  final ValueChanged<int> titulo;
  
  NavigationBarWidget({
    Key? key,
    required this.selectedIndex,
    required this.titulo
  }) : super(key: key);


  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    return DotNavigationBar(
      margin: const EdgeInsets.only(left: 10, right: 10),
      currentIndex: widget.selectedIndex,
      dotIndicatorColor: colorPrincipal,
      unselectedItemColor: Colors.grey[300],
      // enableFloatingNavBar: false,
      onTap: (index) {
        setState(() {
          if(widget.selectedIndex != index) {
            widget.titulo(index);              
          }
        });
      },
      items: [
        /// Home
        DotNavigationBarItem(
          icon: const Icon(Icons.home),
          selectedColor: colorPrincipal,
        ),

        /// Search
        DotNavigationBarItem(
          icon: const Icon(Icons.search),
          selectedColor: colorPrincipal,
        ),

        /// Profile
        DotNavigationBarItem(
          icon: const Icon(Icons.person),
          selectedColor: colorPrincipal,
        ),
      ]
    );

  }
}