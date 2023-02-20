import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/models/articles_model.dart';
import 'package:prueba_tecnica/src/screens/noticias/detalle_noticia_screen.dart';

class ItemNoticiaWidget extends StatefulWidget {

  final ArticlesModel articlesModel;

  const ItemNoticiaWidget({
    Key? key,
    required this.articlesModel
  }) : super(key: key);

  @override
  State<ItemNoticiaWidget> createState() => _ItemNoticiaWidgetState();
}

class _ItemNoticiaWidgetState extends State<ItemNoticiaWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => DetalleNoticiaScreen(articlesModel: widget.articlesModel)));
        },
        child: Card(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              _imageWidget(),
              _tituloWidget(),
              _autorFechaWidget()
            ],
          ),
        ),
      ),
    );
  }

  Widget _tituloWidget() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Text(
        widget.articlesModel.title,
        style: const TextStyle(
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget _imageWidget() {
    final size = MediaQuery.of(context).size;
    return widget.articlesModel.urlToImage.isNotEmpty ? 
    ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20), 
        topRight: Radius.circular(20)
      ),
      child: SizedBox(
        width: size.width * 0.9,
        height: size.height * 0.25,
        child:  Image.network(
          widget.articlesModel.urlToImage,
          fit: BoxFit.cover,
        ),
      ),
    ) : const SizedBox() ;
  }

  Widget _autorFechaWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, bottom: 15),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              widget.articlesModel.source!.name,
              style: const TextStyle(
                fontWeight: FontWeight.w200,
              )
            ),
          ),
          Text(
            widget.articlesModel.publishedAt.split(' ')[1],
            style: const TextStyle(
              fontWeight: FontWeight.w200,
            )
          
          ),
        ],
      ),
    );
  }
}