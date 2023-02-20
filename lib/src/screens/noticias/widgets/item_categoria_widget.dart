
import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/models/categoria_model.dart';
import 'package:prueba_tecnica/src/utils/constantes.dart';

class ItemCategoriaWidget extends StatefulWidget {
  
  final CategoriaModel categoria;
  final int index;
  
  const ItemCategoriaWidget({
    Key? key,
    required this.categoria,
    required this.index,
  }) : super(key: key);

  @override
  State<ItemCategoriaWidget> createState() => _ItemCategoriaWidgetState();
}

class _ItemCategoriaWidgetState extends State<ItemCategoriaWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: widget.categoria.index == widget.index ?
          colorPrincipal : 
          Colors.grey[200],
        borderRadius: BorderRadius.circular(30)
      ),
      child: Center(
        child: Text(
          widget.categoria.titulo,
          style: TextStyle(
            fontSize: 14,
            color: widget.categoria.index == widget.index ?
              Colors.white : Colors.black,
            fontWeight: FontWeight.w300
          ),
        ),
      ),
    );
  }
}