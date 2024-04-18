import 'package:firebase_auth/firebase_auth.dart';

import '../controllers/auth_controller.dart';

class Auth {
  final _auth = FirebaseAuth.instance;

  Stream<User?> get stream => _auth.authStateChanges().asBroadcastStream();

  Future<String?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      // TODO use _auth to create an account
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      return null;
    } on FirebaseAuthException catch (e) {
      return _parseSignInAuthException(e);
    }
  }

  Future<String?> createAccountWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return null;
    } on FirebaseAuthException catch (e) {
      return _parseCreateAccountAuthException(e);
    }
  }


  //Google Authentication
  //Future<UserCredential>signInWithGoogle()async
  //{

 // }
  String? get userId {
    return _auth.currentUser?.uid;
  }

  void signOut() {
    print('_auth.signOut();');
    _auth.signOut();
    //code to sign out
    //AuthController().signOut();
  }

  String _parseSignInAuthException(FirebaseAuthException exception) {
    switch (exception.code) {
      case 'invalid-email':
        return 'Email address is not formatted correctly';
      case 'user-not-found':
      case 'wrong-password':
      case 'user-disabled':
        return 'Invalid username or password';
      case 'network-request-failed':
        return 'Please ensure you are online and try again';
      case 'too-many-requests':
      case 'operation-not-allowed':
      default:
        return 'An unknown error occurred';
    }
  }

  String _parseCreateAccountAuthException(FirebaseAuthException exception) {
    switch (exception.code) {
      case 'weak-password':
        return 'Password is too weak';
      case 'invalid-email':
        return 'Email address is not formatted correctly';
      case 'email-already-in-use':
        return 'This email address already exists';
      case 'network-request-failed':
        return 'Please ensure you are online and try again';
      default:
        return 'An unknown error occurred';
    }
  }
}