import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/models/categoria_model.dart';
import 'package:prueba_tecnica/src/screens/inicio/bloc/inicio_bloc.dart';
import 'package:prueba_tecnica/src/screens/noticias/bloc/noticias_bloc.dart';
import 'package:prueba_tecnica/src/screens/noticias/utility/noticias_utility.dart';
import 'package:prueba_tecnica/src/screens/noticias/widgets/item_categoria_widget.dart';

class CategoriasWidget extends StatefulWidget {

  final NoticiasBloc noticiasBloc;
  final InicioBloc inicioBloc;

  const CategoriasWidget({
    Key? key,
    required this.noticiasBloc,
    required this.inicioBloc
  }) : super(key: key);

  @override
  State<CategoriasWidget> createState() => _CategoriasWidgetState();
}

class _CategoriasWidgetState extends State<CategoriasWidget> {
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: widget.noticiasBloc.index,
      builder: (context, snapshot) {
        
        int indexValue = 0;
        
        if(snapshot.hasData) {
          indexValue = snapshot.data!;
        }

        return Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(listaCategorias.length, (index) {
                return GestureDetector(
                  onTap: () async {
                    widget.noticiasBloc.indexNext(index);
                    if(listaCategorias[index].titulo == 'Todo') {
                      await noticiasTop();
                    } else {
                      await noticiasCategoria(categoria: listaCategorias[index].categoria);
                    }
                  },
                  child: ItemCategoriaWidget(categoria: listaCategorias[index], index: indexValue));
              }),
            ),
          ),
        );
      }
    );
  }

  List<CategoriaModel> listaCategorias = [
    CategoriaModel(
      index: 0,
      categoria: 'all',
      titulo: 'Todo'
    ),
    CategoriaModel(
      index: 1,
      categoria: 'sports', 
      titulo: 'Deportes', 
    ),
    CategoriaModel(
      index: 2,
      titulo: 'Negocios', 
      categoria: 'business', 
    ),
    CategoriaModel(
      index: 3,
      categoria: 'science', 
      titulo: 'Ciencia', 
    ),
    CategoriaModel(
      index: 4,
      categoria: 'entertainment',
      titulo: 'Entretenimiento', 
    ),
  ];

  Future noticiasTop() async {
    await NoticiasUtility.instance.obtenerNoticiasTop(
      noticiasBloc: widget.noticiasBloc, 
      inicioBloc: widget.inicioBloc, 
    );
  }

  Future noticiasCategoria({
    required String categoria
  }) async {
    await NoticiasUtility.instance.obtenerNoticiasCategoria(
      noticiasBloc: widget.noticiasBloc, 
      inicioBloc: widget.inicioBloc, 
      categoria: categoria
    );
  }
}