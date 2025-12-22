

import 'package:firebase_auth/firebase_auth.dart';

class LoginService {
  Future<String?> loginUser({
  required String email,
  required String password,
}) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return null;
  } on FirebaseAuthException catch (e) {
    return e.message;
  } catch (e) {
    return "Something went wrong.";
  }
}
}