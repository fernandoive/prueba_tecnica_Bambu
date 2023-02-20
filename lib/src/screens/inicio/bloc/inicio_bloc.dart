import 'package:prueba_tecnica/src/models/usuario_model.dart';
import 'package:rxdart/rxdart.dart';

class InicioBloc {
  final _mostrarCircularProgress = BehaviorSubject<bool>.seeded(false);
  final _usuarioModel = BehaviorSubject<UsuarioModel>();
  final _pais = BehaviorSubject<String>.seeded('mx');

  //////////////////////////////////////////////////
  ///       mostrarCircularProgress
  //////////////////////////////////////////////////
  Stream<bool> get mostrarCircularProgress => _mostrarCircularProgress.stream;

  bool get mostrarCircularProgressValue => _mostrarCircularProgress.value;

  mostrarCircularProgressNext(bool mostrarCircularProgress) {
    _mostrarCircularProgress.sink.add(mostrarCircularProgress);
  }

  //////////////////////////////////////////////////
  ///       usuarioModel
  //////////////////////////////////////////////////
  Stream<UsuarioModel> get usuarioModel => _usuarioModel.stream;

  UsuarioModel? get usuarioModelValue => _usuarioModel.valueOrNull;

  usuarioModelNext(UsuarioModel usuarioModel) {
    _usuarioModel.sink.add(usuarioModel);
  }

  //////////////////////////////////////////////////
  ///       pais
  //////////////////////////////////////////////////
  Stream<String> get pais => _pais.stream;

  String? get paisValue => _pais.valueOrNull;

  paisNext(String pais) {
    _pais.sink.add(pais);
  }

  dispose() {
    _mostrarCircularProgress.close();
    _usuarioModel.close();
    _pais.close();
  }
}
