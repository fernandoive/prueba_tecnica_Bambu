import 'dart:convert';
// Bloc
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:prueba_tecnica/src/models/usuario_model.dart';
import 'package:prueba_tecnica/src/screens/login/bloc/login_bloc.dart';

// Models
import 'package:prueba_tecnica/src/models/respuesta_utility_model.dart';
import 'package:prueba_tecnica/src/services/repository/user_repository.dart';

// Services

class LoginUtility {
  LoginUtility._();
  static final LoginUtility instance = LoginUtility._();

  Future<RespuestaUtilityModel> login({
    required LoginBloc loginBloc,
    required UserRepository userRepository
  }) async {
    loginBloc.mostrarCircularProgressNext(true);
    final RespuestaUtilityModel respuestaUtilityModel = RespuestaUtilityModel();

    try {

      String? correo = loginBloc.correoValue;
      String? password = loginBloc.passwordValue;

      if (correo == null || password == null) {
        throw '';
      }

      await userRepository.signInEmailAndPassword(
        email: correo, 
        password: password
      ).then((UserCredential userCredential) async {
        
        await userRepository.getUserDB(
          uid: userCredential.user!.uid
        ).then((DataSnapshot dataSnapshot) {
          
          UsuarioModel usuarioModel = UsuarioModel.fromData(dataSnapshot);

          loginBloc.usuarioModelNext(usuarioModel);

        });
      
      });



    } catch (error) {
      respuestaUtilityModel.error = true;
      respuestaUtilityModel.mensaje =
          'Error al iniciar sesión, correo y/o contraseña incorrectos';
    }

    loginBloc.mostrarCircularProgressNext(false);
    return respuestaUtilityModel;
  }
}
