import 'package:http/http.dart' as http;

class NoticiasApi {

  NoticiasApi._();
  static final NoticiasApi instance = NoticiasApi._();

  static const HOST = 'newsapi.org';
  static const START_PATH = '/v2';
  static const COUNTRY = 'mx';
  static const HTTP = 'https';
  static const API_KEY = 'a9069bf89f6a4d619b132aa9e26ebca6';

  final headers = <String, String>{
    "Accept": "application/json",
    'Content-Type': 'application/json; charset=UTF-8',
  };

  Future<http.Response> topHeadlines() async {
    Uri url = Uri(
      scheme: HTTP,
      host: HOST,
      path: '$START_PATH/top-headlines',
      queryParameters: {
        'country': COUNTRY,
        'apiKey': API_KEY
      }
    );
    return await http.get(
      url,
      headers: headers,
    );
  }

  Future<http.Response> categorys({
    required String categoria
  }) async {
    Uri url = Uri(
      scheme: HTTP,
      host: HOST,
      path: '$START_PATH/top-headlines',
      queryParameters: {
        'country': COUNTRY,
        'category': categoria.toString(),
        'apiKey': API_KEY
      }
    );
    return await http.get(
      url,
      headers: headers,
    );
  }

  Future<http.Response> everything({
    required String palabraClave
  }) async {
    Uri url = Uri(
      scheme: HTTP,
      host: HOST,
      path: '$START_PATH/everything',
      queryParameters: {
        'q': palabraClave,
        'apiKey': API_KEY,
      }
    );
    return await http.get(
      url,
      headers: headers,
    );
  }

}