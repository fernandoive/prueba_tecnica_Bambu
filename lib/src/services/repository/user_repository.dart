import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class UserRepository{
  final FirebaseAuth _firebaseAuth;

  UserRepository({FirebaseAuth? firebaseAuth}) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<UserCredential> signInEmailAndPassword({
    required String email, 
    required String password
  }) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password
    );
  }

  Future<UserCredential> signUp({
    required String email, 
    required String password, 
  }) async{
    return await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password
    );
  }

  Future<void> insertDB({
    required String email, 
    required String password, 
    required String nombre, 
    required String uid
  }) async{
    await FirebaseDatabase.instance.ref().child('users/$uid').set({'email': email, 'password': password, 'nombre': nombre, 'uid': uid});
  }

  Future<DataSnapshot> getUserDB({
    required String uid
  }) async{
    return await FirebaseDatabase.instance.ref().child('users/$uid').get();
  }

  Future<List<void>> signOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
    ]);
  }
  
}