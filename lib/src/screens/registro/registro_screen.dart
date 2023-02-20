import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/screens/registro/bloc/registro_bloc.dart';
import 'package:prueba_tecnica/src/screens/registro/widgets/boton_registrar_widget.dart';
import 'package:prueba_tecnica/src/screens/registro/widgets/nombre_widget.dart';
import 'package:prueba_tecnica/src/screens/registro/widgets/password_confirmar_widget.dart';
import 'package:prueba_tecnica/src/services/repository/user_repository.dart';
import 'package:prueba_tecnica/src/widgets/correo_widget.dart';
import 'package:prueba_tecnica/src/widgets/loading_circular_progress_widget.dart';
import 'package:prueba_tecnica/src/widgets/password_widget.dart';

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({Key? key}) : super(key: key);

  @override
  State<RegistroScreen> createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {

  late RegistroBloc _registroBloc;
  late UserRepository _userRepository;

  @override
  void initState() {
    _registroBloc = RegistroBloc();
    _userRepository = UserRepository();
    super.initState();
  }

  @override
  void dispose() {
    _registroBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingCircularProgressWidget(
      streamMostrarCircularProgress: _registroBloc.mostrarCircularProgress,
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
              _correoWidget(),
              _nombreWidget(),
              _passwordWidget(),
              _passwordConfirmarWidget(),
              _btnRegistrarWidget()
            ],
          ),
        ),
      ),
    );
  }

  Widget _correoWidget() {
    return CorreoWidget(
      correoController: _registroBloc.correoControllerValue,
      correoNext: _registroBloc.correoNext,
      correoStream: _registroBloc.correo,
      correoValue: _registroBloc.correoValue,
    );
  }

  Widget _nombreWidget() {
    return NombreWidget(
      registroBloc: _registroBloc,
    );
  }

  Widget _passwordWidget() {
    return PasswordWidget(
      passwordController: _registroBloc.passwordControllerValue,
      passwordNext: _registroBloc.passwordNext,
      passwordStream: _registroBloc.password,
      passwordValue: _registroBloc.passwordValue,
    );
  }

  Widget _passwordConfirmarWidget() {
    return PasswordConfirmarWidget(
      registroBloc: _registroBloc,
    );
  }

  Widget _btnRegistrarWidget() {
    return BotonRegistrarWidget(registroBloc: _registroBloc, userRepository: _userRepository);
  }
}