import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

// Models
import 'package:prueba_tecnica/src/models/usuario_model.dart';

// Validators
import 'package:prueba_tecnica/src/screens/registro/bloc/registro_validator.dart';

class RegistroBloc with RegistroValidators {

  final _mostrarCircularProgress = BehaviorSubject<bool>.seeded(false);

  final _correo = BehaviorSubject<String>();
  final _correoController = BehaviorSubject<TextEditingController>.seeded(TextEditingController());
  
  final _password = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<TextEditingController>.seeded(TextEditingController());

  final _nombre = BehaviorSubject<String>();
  final _nombreController = BehaviorSubject<TextEditingController>.seeded(TextEditingController());

  final _passwordConfirmar = BehaviorSubject<String>();
  final _passwordConfirmarController = BehaviorSubject<TextEditingController>.seeded(TextEditingController());
  
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
  ///       nombre
  //////////////////////////////////////////////////
  Stream<String> get nombre => _nombre.stream;

  String? get nombreValue => _nombre.valueOrNull;

  nombreNext(String nombre) {
    _nombre.sink.add(nombre);
  }

  //////////////////////////////////////////////////
  ///       nombreController
  //////////////////////////////////////////////////
  TextEditingController get nombreControllerValue =>
      _nombreController.value;

  //////////////////////////////////////////////////
  ///       passwordConfirmar
  //////////////////////////////////////////////////
  Stream<String> get passwordConfirmar => _passwordConfirmar.stream;

  String? get passwordConfirmarValue => _passwordConfirmar.valueOrNull;

  passwordConfirmarNext(String passwordConfirmar) {
    _passwordConfirmar.sink.add(passwordConfirmar);
  }

  //////////////////////////////////////////////////
  ///       passwordConfirmarController
  //////////////////////////////////////////////////
  TextEditingController get passwordConfirmarControllerValue =>
      _passwordConfirmarController.value;

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
    password,
    nombre,
    passwordConfirmar
  ], (List<dynamic> streams) {
  if ((streams[0] == _correo.value) &&
     (streams[1] == _password.value) &&
     (streams[2] == _nombre.value) &&
     (streams[3] == _passwordConfirmar.value) &&
     (confirmarPassword()) 
    ) {
    return true;
  }
    return false;
  });

  bool confirmarPassword() {
    if(passwordValue == passwordConfirmarValue) {
      return true;
    }
    return false;
  }

  dispose() {
    _mostrarCircularProgress.close();
    _correo.close();
    _password.close();
    _correoController.value.dispose();
    _correoController.close();
    _passwordController.value.dispose();
    _passwordController.close();
    _nombre.close();
    _nombreController.value.dispose();
    _nombreController.close();
    _passwordConfirmar.close();
    _passwordConfirmarController.value.dispose();
    _passwordConfirmarController.close();
    _usuarioModel.close();
  }

}
