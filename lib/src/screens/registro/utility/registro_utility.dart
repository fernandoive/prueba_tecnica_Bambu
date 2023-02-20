// Bloc
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prueba_tecnica/src/models/usuario_model.dart';
import 'package:prueba_tecnica/src/screens/login/bloc/login_bloc.dart';

// Models
import 'package:prueba_tecnica/src/models/respuesta_utility_model.dart';
import 'package:prueba_tecnica/src/screens/registro/bloc/registro_bloc.dart';
import 'package:prueba_tecnica/src/services/repository/user_repository.dart';

// Services

class RegistroUtility {
  RegistroUtility._();
  static final RegistroUtility instance = RegistroUtility._();

  Future<RespuestaUtilityModel> registro({
    required RegistroBloc registroBloc,
    required UserRepository userRepository
  }) async {
    registroBloc.mostrarCircularProgressNext(true);
    final RespuestaUtilityModel respuestaUtilityModel = RespuestaUtilityModel();

    try {

      String? correo = registroBloc.correoValue;
      String? password = registroBloc.passwordValue;
      String? nombre = registroBloc.nombreValue;
      String? passwordConfirmar = registroBloc.passwordConfirmarValue;

      if (correo == null || password == null || nombre == null || passwordConfirmar == null) {
        throw '';
      }

      await userRepository.signUp(
        email: correo, 
        password: password,
      ).then((UserCredential userCredential) {
        if(userCredential.user!.uid.isNotEmpty) {
          
          userRepository.insertDB(
            email: correo, 
            password: password, 
            nombre: nombre, 
            uid: userCredential.user!.uid
          );

          UsuarioModel usuarioModel = UsuarioModel(
            nombre: nombre,
            correo: correo,
            uid: userCredential.user!.uid
          );

          registroBloc.usuarioModelNext(usuarioModel);
        
        }
      }).catchError((error) {
        throw error;
      });


    } catch (error) {
      respuestaUtilityModel.error = true;
      respuestaUtilityModel.mensaje =
          'Verifica que el email no este en uso, intentalo de nuevo';
    }

    registroBloc.mostrarCircularProgressNext(false);
    return respuestaUtilityModel;
  }
}
