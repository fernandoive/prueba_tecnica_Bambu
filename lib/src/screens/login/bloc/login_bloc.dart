import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/models/usuario_model.dart';
import 'package:rxdart/rxdart.dart';

// Models

// Validators
import 'package:prueba_tecnica/src/screens/login/bloc/login_validator.dart';

class LoginBloc with LoginValidators {

  final _mostrarCircularProgress = BehaviorSubject<bool>.seeded(false);

  final _correo = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _correoController = BehaviorSubject<TextEditingController>.seeded(TextEditingController());
  final _passwordController = BehaviorSubject<TextEditingController>.seeded(TextEditingController());
  
  final _usuarioModel = BehaviorSubject<UsuarioModel>();

  //////////////////////////////////////////////////
  ///       mostrarCircularProgress
  //////////////////////////////////////////////////
  Stream<bool> get mostrarCircularProgress => _mostrarCircularProgress.stream;

  bool get mostrarCircularProgressValue => _mostrarCircularProgress.value;

  mostrarCircularProgressNext(bool mostrarCircularProgress) {
    _mostrarCircularProgress.sink.add(mostrarCircularProgress);
  }

  //////////////////////////////////////////////////
  ///       Correo
  //////////////////////////////////////////////////
  Stream<String> get correo => _correo.stream.transform(validarCorreo);

  String? get correoValue => _correo.valueOrNull;

  correoNext(String correo) {
    _correo.sink.add(correo);
  }

  //////////////////////////////////////////////////
  ///       correoController
  //////////////////////////////////////////////////
  TextEditingController get correoControllerValue =>
      _correoController.value;

  //////////////////////////////////////////////////
  ///       password
  //////////////////////////////////////////////////
  Stream<String> get password => _password.stream.transform(validarPassword);

  String? get passwordValue => _password.valueOrNull;

  passwordNext(String password) {
    _password.sink.add(password);
  }

  //////////////////////////////////////////////////
  ///       passwordController
  //////////////////////////////////////////////////
  TextEditingController get passwordControllerValue =>
      _passwordController.value;

  //////////////////////////////////////////////////
  ///       usuarioModel
  //////////////////////////////////////////////////
  Stream<UsuarioModel> get usuarioModel => _usuarioModel.stream;

  UsuarioModel? get usuarioModelValue => _usuarioModel.valueOrNull;

  usuarioModelNext(UsuarioModel usuarioModel) {
    _usuarioModel.sink.add(usuarioModel);
  }

  //////////////////////////////////////////////////
  ///       formularioLoginStream
  //////////////////////////////////////////////////
  Stream<bool> get formularioStream =>
  Rx.combineLatest([
    correo, 
    password
  ], (List<dynamic> streams) {
  if ((streams[0] == _correo.value) &&
     (streams[1] == _password.value)) {
    return true;
  }
    return false;
  });

  dispose() {
    _mostrarCircularProgress.close();
    _correo.close();
    _password.close();
    _correoController.value.dispose();
    _correoController.close();
    _passwordController.value.dispose();
    _passwordController.close();
    _usuarioModel.close();
  }

}
