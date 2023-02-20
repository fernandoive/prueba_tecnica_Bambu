import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/screens/login/bloc/login_bloc.dart';
import 'package:prueba_tecnica/src/screens/login/widgets/boton_iniciar_sesion_widget.dart';
import 'package:prueba_tecnica/src/screens/login/widgets/registro_widget.dart';
import 'package:prueba_tecnica/src/widgets/loading_circular_progress_widget.dart';
import 'package:prueba_tecnica/src/widgets/password_widget.dart';
import 'package:prueba_tecnica/src/screens/login/widgets/texto_bienvenida_widget.dart';
import 'package:prueba_tecnica/src/widgets/correo_widget.dart';
import 'package:prueba_tecnica/src/services/repository/user_repository.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  late UserRepository _userRepository;
  late LoginBloc  _loginBloc;

  @override
  void initState() {
    _loginBloc = LoginBloc();
    _userRepository = UserRepository();
    super.initState();
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingCircularProgressWidget(
      streamMostrarCircularProgress: _loginBloc.mostrarCircularProgress,
      child: Scaffold(
        body: _body()
      ),
    );
  }

  Widget _body() {
    final size = MediaQuery.of(context).size.width;
    return Center(
      child: SingleChildScrollView(
        child:SizedBox(
          width: size * 0.85,
          child: Column(
            children: [
              _txtBienvenidaWidget(),
              _correoWidget(),
              _passwordWidget(),
              _btnIniciarSesionWidget(),
              _registroWidget()
            ],
          ),
        ),
      ),
    );
  }

  Widget _txtBienvenidaWidget() {
    return const TextoBienvenidaWidget();
  }
  
  Widget _correoWidget() {
    return CorreoWidget(
      correoController: _loginBloc.correoControllerValue,
      correoNext: _loginBloc.correoNext,
      correoStream: _loginBloc.correo,
      correoValue: _loginBloc.correoValue,
    );
  }

  Widget _passwordWidget() {
    return PasswordWidget(
      passwordController: _loginBloc.passwordControllerValue,
      passwordNext: _loginBloc.passwordNext,
      passwordStream: _loginBloc.password,
      passwordValue: _loginBloc.passwordValue,
    );
  }

  Widget _btnIniciarSesionWidget() {
    return BotonIniciarSesionWidget(loginBloc: _loginBloc, userRepository: _userRepository);
  }

  Widget _registroWidget() {
    return const RegistroWidget();
  }
}