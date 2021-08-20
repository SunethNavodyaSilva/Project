import 'package:firebase_auth/firebase_auth.dart';

Future<bool> logIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<bool> register(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return true;
    
  } on FirebaseAuthException catch (e) {
    if (e.code == 'Password is too weak') {
      print('Password is too weak');
    } else if (e.code == 'Existing Email') {
      print('Existing Email');
    }
    return false;
  } catch (e) {
    print(e.toString());
    return false;
  }
}

Future<bool> signOut() async {
  try {
    await FirebaseAuth.instance.signOut();
    return true;
  } catch (e) {
    print(e.toString());
    return null;
  }
}



