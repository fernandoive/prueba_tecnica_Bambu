import 'package:prueba_tecnica/src/models/articles_model.dart';
import 'package:rxdart/rxdart.dart';

class NoticiasBloc {

  final _mostrarCircularProgress = BehaviorSubject<bool>.seeded(false);

  final _listaNoticias = BehaviorSubject<List<ArticlesModel>>();
  final _index = BehaviorSubject<int>.seeded(0);

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
  ///       index
  //////////////////////////////////////////////////
  Stream<int> get index => _index.stream;

  int? get indexValue => _index.valueOrNull;

  indexNext(int index) {
    _index.sink.add(index);
  }

  dispose() {
    _mostrarCircularProgress.close();
    _listaNoticias.close();
    _index.close();
  }

}
