import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/utils/constantes.dart';

class PasswordWidget extends StatefulWidget {
  const PasswordWidget({
    Key? key,
    required this.passwordController,
    required this.passwordValue,
    required this.passwordStream,
    required this.passwordNext,
  }) : super(key: key);

  final TextEditingController passwordController;
  final String? passwordValue;
  final Stream<String> passwordStream;
  final Function(String) passwordNext;
  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  
  bool passwordVisible = true;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();

    _passwordController = widget.passwordController;
    String? password = widget.passwordValue;

    if (password != null) {
      _passwordController.text = password;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: widget.passwordStream,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        
        return Column(
          children: [
            labelWidget(),
            Container(
              margin: margenCamposFormulario,
              child: TextField(
                controller: _passwordController,
                obscureText: passwordVisible,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  enabledBorder: outlineInputBorder,
                  disabledBorder: outlineInputBorder,
                  errorBorder: outlineInputBorder,
                  focusedBorder: outlineInputBorder,
                  hintText: '********',
                  hintStyle: estiloHintInputs,
                  suffixIcon: _btnVisiblePassword()
                ),
                onChanged: (String value) => widget.passwordNext(value),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget labelWidget() {
    return Row(
      children: const [
        Text(
          'Contraseña',
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