import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:prueba_tecnica/src/models/articles_model.dart';
import 'package:prueba_tecnica/src/screens/inicio/bloc/inicio_bloc.dart';

// Bloc
import 'package:prueba_tecnica/src/screens/noticias/bloc/noticias_bloc.dart';

// Models
import 'package:prueba_tecnica/src/models/respuesta_utility_model.dart';
import 'package:prueba_tecnica/src/services/api/noticias_api.dart';

// Services

class NoticiasUtility {
  NoticiasUtility._();
  static final NoticiasUtility instance = NoticiasUtility._();

  Future<RespuestaUtilityModel> obtenerNoticiasTop({
    required NoticiasBloc noticiasBloc,
    required InicioBloc inicioBloc
  }) async {
    
    inicioBloc.mostrarCircularProgressNext(true);
    
    final RespuestaUtilityModel respuestaUtilityModel = RespuestaUtilityModel();

    try {
      await NoticiasApi.instance.topHeadlines(
        pais: inicioBloc.paisValue!
      ).then((http.Response response) {

        if(response.statusCode != 200) {
          throw 'Error';
        }

        Map<String, dynamic> parsedJson = jsonDecode(response.body);

        List<Map<String, dynamic>> listaParsedJson = [];

        if (parsedJson['articles'] != null) {
          for (int i = 0; i < parsedJson['articles'].length; i++) {
            listaParsedJson.add(parsedJson['articles'][i]);
          }
        }

        final List<ArticlesModel> listArticlesModel = ArticlesModel().fromJsonList(listaParsedJson);

        noticiasBloc.listaNoticiasNext(listArticlesModel);

      }).catchError((error) {
        throw error;
      });


    } catch (error) {
      respuestaUtilityModel.error = true;
      respuestaUtilityModel.mensaje =
          'Error al iniciar sesión, correo y/o contraseña incorrectos';
    }

    inicioBloc.mostrarCircularProgressNext(false);
    return respuestaUtilityModel;
  }
 
  Future<RespuestaUtilityModel> obtenerNoticiasCategoria({
    required NoticiasBloc noticiasBloc,
    required InicioBloc inicioBloc,
    required String categoria
  }) async {
    
    inicioBloc.mostrarCircularProgressNext(true);
    
    final RespuestaUtilityModel respuestaUtilityModel = RespuestaUtilityModel();

    try {
      await NoticiasApi.instance.categorys(
        categoria: categoria,
        pais: inicioBloc.paisValue!
      ).then((http.Response response) {

        if(response.statusCode != 200) {
          throw 'Error';
        }

        Map<String, dynamic> parsedJson = jsonDecode(response.body);

        List<Map<String, dynamic>> listaParsedJson = [];

        if (parsedJson['articles'] != null) {
          for (int i = 0; i < parsedJson['articles'].length; i++) {
            listaParsedJson.add(parsedJson['articles'][i]);
          }
        }

        final List<ArticlesModel> listArticlesModel = ArticlesModel().fromJsonList(listaParsedJson);

        noticiasBloc.listaNoticiasNext(listArticlesModel);

      }).catchError((error) {
        throw error;
      });


    } catch (error) {
      respuestaUtilityModel.error = true;
      respuestaUtilityModel.mensaje =
          'Error al iniciar sesión, correo y/o contraseña incorrectos';
    }

    inicioBloc.mostrarCircularProgressNext(false);
    return respuestaUtilityModel;
  }
}
