import 'package:firebase_database/firebase_database.dart';

class UsuarioModel{
  
  String uid;
  String nombre;
  String correo;

  UsuarioModel({
    this.correo = '',
    this.nombre = '',
    this.uid = ''
  });

  
  factory UsuarioModel.fromData(DataSnapshot snapshot) {
    return UsuarioModel(
      nombre: snapshot.child('nombre').value.toString(),
      correo: snapshot.child('email').value.toString(),
      uid: snapshot.child('uid').value.toString(),
      // id: (parsedJson['id'] != null) ? parsedJson['id'] : 0,
    );
  }

}