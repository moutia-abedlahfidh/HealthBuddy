

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpService {

  
  Future<String?> registerUser({required String name,required String email,required String password,}) async {
  try {
    // Create user in Firebase Auth
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    String uid = userCredential.user!.uid;

    // Store additional data in Firestore
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'name': name,
      'email': email,
      'createdAt': DateTime.now().toIso8601String(),
    });
    
    return null; 
  } on FirebaseAuthException catch (e) {
    return e.message;
  } catch (e) {
    return "Something went wrong. Try again.";
  }
}
}