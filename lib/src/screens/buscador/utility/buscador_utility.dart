import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:prueba_tecnica/src/models/articles_model.dart';
import 'package:prueba_tecnica/src/screens/buscador/bloc/buscador_bloc.dart';

// Bloc
import 'package:prueba_tecnica/src/screens/inicio/bloc/inicio_bloc.dart';

// Models
import 'package:prueba_tecnica/src/models/respuesta_utility_model.dart';
import 'package:prueba_tecnica/src/services/api/noticias_api.dart';

// Services

class BuscadorUtility {
  BuscadorUtility._();
  static final BuscadorUtility instance = BuscadorUtility._();

  Future<RespuestaUtilityModel> obtenerNoticias({
    required BuscadorBloc buscadorBloc,
    required InicioBloc inicioBloc
  }) async {
    
    inicioBloc.mostrarCircularProgressNext(true);
    
    final RespuestaUtilityModel respuestaUtilityModel = RespuestaUtilityModel();

    try {
      await NoticiasApi.instance.everything(
        palabraClave: buscadorBloc.palabraClaveValue!
      ).then((http.Response response) {

        print(response.body);

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

        buscadorBloc.listaNoticiasNext(listArticlesModel);

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
