
import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/models/respuesta_utility_model.dart';
import 'package:prueba_tecnica/src/screens/inicio/inicio_screen.dart';
import 'package:prueba_tecnica/src/screens/login/utility/login_utility.dart';
import 'package:prueba_tecnica/src/services/repository/user_repository.dart';
import 'package:prueba_tecnica/src/utils/constantes.dart';
import 'package:gradient_ui_widgets/gradient_ui_widgets.dart' as gr;

// Bloc
import 'package:prueba_tecnica/src/screens/login/bloc/login_bloc.dart';
import 'package:prueba_tecnica/src/widgets/dialogo_error_widget.dart';

class BotonIniciarSesionWidget extends StatefulWidget {

  final LoginBloc loginBloc;
  final UserRepository userRepository;

  const BotonIniciarSesionWidget({
    Key? key, 
    required this.loginBloc,
    required this.userRepository,
  }) : super(key: key);


  @override
  State<BotonIniciarSesionWidget> createState() =>
      _BotonIniciarSesionWidgetState();
}

class _BotonIniciarSesionWidgetState extends State<BotonIniciarSesionWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return StreamBuilder<bool>(
      stream: widget.loginBloc.formularioStream,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {

        bool habilitarBoton = false;
        
        if (snapshot.hasData) {
          habilitarBoton = snapshot.data!;
        }
    
        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            height: 50,
            width: size * 0.85,
            child: gr.GradientElevatedButton(
              onPressed: () {
                _onClick(habilitarBoton);
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )
                )
              ),
              gradient: habilitarBoton ? 
                gradientHabilitado : gradientDesabilitado,
              child: const Text(
                "Iniciar Sesión",
                style: estiloTextoBoton
              ),
            ),
          ),
        );
      }
    );
  }

  Future<void> _onClick(bool habilitarBoton) async {
    if (habilitarBoton ) {
      RespuestaUtilityModel respuestaUtilityModel =
          await LoginUtility.instance.login(
            loginBloc: widget.loginBloc,
            userRepository: widget.userRepository
          );
      if (respuestaUtilityModel.error) {
        _dialogo(respuestaUtilityModel.mensaje);
      } else {
         if (mounted) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => InicioScreen(usuarioModel: widget.loginBloc.usuarioModelValue!)));
        }
      }
    }
  }

  Future<void> _dialogo(String mensaje) async {
    return dialogError(context, mensaje);
  }
}
