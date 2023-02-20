import 'dart:async';

class RegistroValidators {
    final validarCorreo = StreamTransformer<String, String>.fromHandlers(
      handleData: (confirmarNumeroCuenta, sink) {
    if (confirmarNumeroCuenta.isEmpty) {
      sink.addError('Favor de llenar el campo Correo');
    } else {
      sink.add(confirmarNumeroCuenta);
    }
  });

  final validarPassword =
      StreamTransformer<String, String>.fromHandlers(handleData: (alias, sink) {
    if (alias.isEmpty) {
      sink.addError('Favor de llenar el campo Contraseña');
    } else {
      sink.add(alias);
    }
  });
}