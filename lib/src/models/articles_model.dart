import 'package:prueba_tecnica/src/models/source_model.dart';

class ArticlesModel{

  SourceModel? source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  ArticlesModel({
    this.source,
    this.author = '',
    this.title = '',
    this.description = '',
    this.url = '',
    this.urlToImage = '',
    this.publishedAt = '',
    this.content = '',
  });

  factory ArticlesModel.fromJson(Map<String, dynamic> parsedJson) {
    
    SourceModel sourceModel = SourceModel.fromJson(parsedJson['source']);
    String fecha = '';
    String hora = '';

    String publishedAt = (parsedJson['publishedAt'] != null) ? parsedJson['publishedAt'] : '';

    if(publishedAt != '') {
      fecha = publishedAt.split('T')[0];
      hora = publishedAt.split('T')[1].replaceAll('Z', '');
    }

    String fechaCompleta = '$fecha $hora' ;


    return ArticlesModel(
      source: sourceModel,
      author: (parsedJson['author'] != null) ? parsedJson['author'] : '',
      title: (parsedJson['title'] != null) ? parsedJson['title'] : '',
      description: (parsedJson['description'] != null) ? parsedJson['description'] : '',
      url: (parsedJson['url'] != null) ? parsedJson['url'] : '',
      urlToImage: (parsedJson['urlToImage'] != null) ? parsedJson['urlToImage'] : '',
      publishedAt: fechaCompleta,
      content: (parsedJson['content'] != null) ? parsedJson['content'] : '',
    );
  }

  List<ArticlesModel> fromJsonList(List<Map<String, dynamic>> listaParsedJson) {
    List<ArticlesModel> listaArticles = [];
    ArticlesModel articles;
    for(int i = 0; i < listaParsedJson.length; i++) {
      articles = ArticlesModel.fromJson(listaParsedJson[i]);
      listaArticles.add(articles);
    }
    return listaArticles;
  }
}