

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class DetailsService {
  
  Future<String?> addDetails(String? uid,String geschlecht,int alt,int gewicht,double grose) async{
    try{
     await  FirebaseFirestore.instance
    .collection('users')
    .doc(uid)
    .update({
      'geschlecht': geschlecht,
      'alt': alt,
      'gewicht': gewicht,
      'grose' : grose
    });
    return null;
    }on FirebaseAuthException catch (e) {
    return e.message;
    }catch(e) {
      return "Something went wrong.";
    }
  }

}