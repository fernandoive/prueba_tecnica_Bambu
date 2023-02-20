import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/models/articles_model.dart';
import 'package:prueba_tecnica/src/screens/buscador/bloc/buscador_bloc.dart';
import 'package:prueba_tecnica/src/screens/noticias/widgets/item_noticia_widget.dart';

class ListaNoticiasWidget extends StatefulWidget {

  final BuscadorBloc buscadorBloc;

  const ListaNoticiasWidget({
    Key? key,
    required this.buscadorBloc
  }) : super(key: key);

  @override
  State<ListaNoticiasWidget> createState() => _ListaNoticiasWidgetState();
}

class _ListaNoticiasWidgetState extends State<ListaNoticiasWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ArticlesModel>>(
      stream: widget.buscadorBloc.listaNoticias,
      builder: (BuildContext context, AsyncSnapshot<List<ArticlesModel>> snapshot) {
        
        List<ArticlesModel> listaNoticias = [];

        if(snapshot.hasData) {
          listaNoticias = snapshot.data!;
          return Column(
            children: List.generate(
              listaNoticias.length, (index) {
                return ItemNoticiaWidget(articlesModel: listaNoticias[index]);
              }
            )
          ); 
        } else {
          return const SizedBox();
        }


      },
    );
  }
}