

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationsService {
  Future<dynamic> getnotifications() async{
    try{
      final prefs = await SharedPreferences.getInstance();
      String? uid = prefs.getString('uid') ;
    var instance = await  FirebaseFirestore.instance
    .collection('notifications')
    .doc(uid)
    .get();
    return instance.data();
    }on FirebaseAuthException catch (e) {
    return e.message;
    }catch(e) {
      return "Something went wrong.";
    }
  }
}