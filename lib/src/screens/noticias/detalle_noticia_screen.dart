import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:prueba_tecnica/src/models/articles_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DetalleNoticiaScreen extends StatefulWidget {
  
  final ArticlesModel articlesModel;

  const DetalleNoticiaScreen({
    Key? key,
    required this.articlesModel
  }) : super(key: key);

  @override
  State<DetalleNoticiaScreen> createState() => _DetalleNoticiaScreenState();
}

class _DetalleNoticiaScreenState extends State<DetalleNoticiaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            tooltip: 'Abrir en el navegador',
            onPressed: () {
              abrirURl();
            }, 
            icon: const Icon(Icons.open_in_browser_outlined)
          ),
          IconButton(
            tooltip: 'Compartir',
            onPressed: () {
              share();
            }, 
            icon: const Icon(Icons.share_outlined)
          ),
        ]
      ),
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
              _tituloWidget(),
              _fechaAutorWidget(),
              _imagenWidget(),
              _descripcionWidget()
            ]
          ),
        ),
      )
    );
  }

  Widget _tituloWidget() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Text(
        widget.articlesModel.title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget _fechaAutorWidget() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Text(
            widget.articlesModel.publishedAt.split(' ')[0],
            style: const TextStyle(
              fontWeight: FontWeight.w200,
            ),
          ),
          widget.articlesModel.author.isNotEmpty ? Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'por ${widget.articlesModel.author}',
              style: const TextStyle(
                fontWeight: FontWeight.w200,
              )
            ),
          ) : const SizedBox(),
          
        ],
      ),
    );
  }

  Widget _imagenWidget() {
    return widget.articlesModel.urlToImage.isNotEmpty ? Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(widget.articlesModel.urlToImage),
      ),
    ) : const SizedBox();
  }

  Widget _descripcionWidget() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Text(
        widget.articlesModel.content,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w300
        ),
      ),
    );
  }

  Future<void> abrirURl() async {
    final Uri launchUri = Uri.parse(
      widget.articlesModel.url
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> share() async {
    await FlutterShare.share(
      title: 'Compartir',
      text: 'Enlace de la noticia',
      linkUrl: widget.articlesModel.url,
      chooserTitle: 'Compartir'
    );
  }
}