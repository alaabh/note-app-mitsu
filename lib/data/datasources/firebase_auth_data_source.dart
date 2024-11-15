import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/entities/user.dart' as domainUser;

class FirebaseAuthDataSource {
  Future<domainUser.User> signIn(String email, String password) async {
    try {
      
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return domainUser.User(
        id: userCredential.user!.uid,
        email: userCredential.user!.email!,
      );
    } catch (e) {
      
      throw Exception('Failed to sign in: $e');
    }
  }

  Future<domainUser.User> signUp(String email, String password) async {
    try {
    
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return domainUser.User(
        id: userCredential.user!.uid,
        email: userCredential.user!.email!,
      );
    } catch (e) {
      
      throw Exception('Failed to sign up: $e');
    }
  }
}