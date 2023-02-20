import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/utils/constantes.dart';

// Bloc
import 'package:prueba_tecnica/src/screens/registro/bloc/registro_bloc.dart';

class PasswordConfirmarWidget extends StatefulWidget {
  
  final RegistroBloc registroBloc;

  const PasswordConfirmarWidget({
    Key? key,
    required this.registroBloc
  }) : super(key: key);
  
  
  @override
  State<PasswordConfirmarWidget> createState() => _PasswordConfirmarWidgetState();
}

class _PasswordConfirmarWidgetState extends State<PasswordConfirmarWidget> {

  bool passwordVisible = true;
  late TextEditingController _passwordConfirmarController;
  
  @override
  void initState() {
    super.initState();
    _passwordConfirmarController = widget.registroBloc.passwordConfirmarControllerValue;
    String? passwordConfirmar = widget.registroBloc.passwordConfirmarValue;

    if (passwordConfirmar != null) {
      _passwordConfirmarController.text = passwordConfirmar;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        labelWidget(),
        Container(
          margin: margenCamposFormulario,
          child: TextFormField(
            autovalidateMode: AutovalidateMode.always,
            controller: _passwordConfirmarController,
            obscureText: passwordVisible,
            keyboardType: TextInputType.visiblePassword,
            // validator: (password) {
            //   if(widget.registroBloc.passwordValue!.isNotEmpty && _passwordConfirmarController.text.isNotEmpty) {
            //     if(widget.registroBloc.passwordValue != _passwordConfirmarController.text) {
            //      return 'Las contraseñas no coinciden';
            //     }
            //   }
            // },
            decoration: InputDecoration(
              enabledBorder: outlineInputBorder,
              disabledBorder: outlineInputBorder,
              errorBorder: outlineInputBorder,
              focusedBorder: outlineInputBorder,
              hintText: '********',
              hintStyle: estiloHintInputs,
              suffixIcon: _btnVisiblePassword(),
            ),
            onChanged: (String value) => widget.registroBloc.passwordConfirmarNext(value),
          ),
        ),
      ],
    );
  }

  Widget labelWidget() {
    return Row(
      children: const [
        Text(
          'Confirmar contraseña',
          style: estiloLabelInputs
        ),
      ],
    );
  }

  Widget _btnVisiblePassword() {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: IconButton(
        onPressed: () {
          setState(() {
            passwordVisible = !passwordVisible;
          });
        }, 
        icon: Icon(
          !passwordVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          color: Colors.grey[300],
        )
      ),
    );
  }
}