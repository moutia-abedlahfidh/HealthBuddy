import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class graphikService {
  Future getSteps() async{
    try{
      final prefs = await SharedPreferences.getInstance();
      String? uid = prefs.getString('uid') ;
    DocumentSnapshot  instance = await  FirebaseFirestore.instance
    .collection('users')
    .doc(uid)
    .get();
    var steps = instance.get('stepsList');
    return steps;
    }on FirebaseAuthException catch (e) {
    return e.message;
    }catch(e) {
      return "Something went wrong.";
    }
  }
}