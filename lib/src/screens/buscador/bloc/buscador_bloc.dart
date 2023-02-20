import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/models/articles_model.dart';
import 'package:rxdart/rxdart.dart';

class BuscadorBloc {

  final _mostrarCircularProgress = BehaviorSubject<bool>.seeded(false);

  final _listaNoticias = BehaviorSubject<List<ArticlesModel>>();

  final _palabraClave = BehaviorSubject<String>();
  final _palabraClaveController = BehaviorSubject<TextEditingController>.seeded(TextEditingController());

  //////////////////////////////////////////////////
  ///       mostrarCircularProgress
  //////////////////////////////////////////////////
  Stream<bool> get mostrarCircularProgress => _mostrarCircularProgress.stream;

  bool get mostrarCircularProgressValue => _mostrarCircularProgress.value;

  mostrarCircularProgressNext(bool mostrarCircularProgress) {
    _mostrarCircularProgress.sink.add(mostrarCircularProgress);
  }

  //////////////////////////////////////////////////
  ///       listaNoticias
  //////////////////////////////////////////////////
  Stream<List<ArticlesModel>> get listaNoticias => _listaNoticias.stream;

  List<ArticlesModel>? get listaNoticiasValue => _listaNoticias.valueOrNull;

  listaNoticiasNext(List<ArticlesModel> listaNoticias) {
    _listaNoticias.sink.add(listaNoticias);
  }

  //////////////////////////////////////////////////
  ///       palabraClave
  //////////////////////////////////////////////////
  Stream<String> get palabraClave => _palabraClave.stream;

  String? get palabraClaveValue => _palabraClave.valueOrNull;

  palabraClaveNext(String palabraClave) {
    _palabraClave.sink.add(palabraClave);
  }

  //////////////////////////////////////////////////
  ///       palabraClaveController
  //////////////////////////////////////////////////
  TextEditingController get palabraClaveControllerValue =>
      _palabraClaveController.value;


  dispose() {
    _mostrarCircularProgress.close();
    _listaNoticias.close();
    _palabraClave.close();
    _palabraClaveController.value.dispose();
    _palabraClaveController.close();
  }

}
