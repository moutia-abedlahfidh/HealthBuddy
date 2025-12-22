

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeService {
  
  Future<dynamic> getUser() async{
    try{
      final prefs = await SharedPreferences.getInstance();
      String? uid = prefs.getString('uid') ;
    var instance = await  FirebaseFirestore.instance
    .collection('users')
    .doc(uid)
    .get();
    return instance;
    }on FirebaseAuthException catch (e) {
    return e.message;
    }catch(e) {
      return "Something went wrong.";
    }
  }

  Future<void> uploadDailySteps(DateTime dateheute , int steps,double kalorien,double km) async {
    final prefs = await SharedPreferences.getInstance();
    String? uid = prefs.getString('uid');
    String dateStr ="${dateheute.day.toString().padLeft(2, '0')}-${dateheute.month.toString().padLeft(2, '0')}-${dateheute.year}";
    if (uid == null) return;

    //final today = DateTime.now().toIso8601String().substring(0, 10);

    try {
      final docRef = FirebaseFirestore.instance
      .collection('users')
      .doc(uid);

  await docRef.update({
    'stepsList': FieldValue.arrayUnion([
      {
        'date': dateStr,
        'steps': steps,
        'kalorien': double.parse(kalorien.toStringAsFixed(2)),
        'km' : km
      }
    ])
  });
      print("✅ Steps uploaded for $dateheute: $steps");
    } catch (e) {
      print("❌ Error uploading steps: $e");
    }
  }

  Future<void> uploadNotificationSchritte(DateTime dateheute) async {
    try{
      final prefs = await SharedPreferences.getInstance();
      String? uid = prefs.getString('uid');
      String dateStr ="${dateheute.day.toString().padLeft(2, '0')}-${dateheute.month.toString().padLeft(2, '0')}-${dateheute.year}";
      if (uid == null) return;
      final docRef = FirebaseFirestore.instance
      .collection('notifications')
      .doc(uid);

      final docSnapshot = await docRef.get();

      if (!docSnapshot.exists) {
        await docRef.set({
    dateStr: FieldValue.arrayUnion([
      {
        'beschreibung': 'Sie sind 10,000 Schritte heute gelaufen . Weiter so !',
        'ziel': 'täglich schritte ziel erreicht!',
      }
    ])
  });
      }else {
        await docRef.update({
    dateStr: FieldValue.arrayUnion([
      {
        'beschreibung': 'Sie sind 10,000 Schritte heute gelaufen . Weiter so !',
        'ziel': 'täglich schritte ziel erreicht!',
      }
    ])
  });
      }

  
      print("✅ Schritte ziel hochgeladet");

    }catch(e) {
      print("❌ fehler bei der benachrichtigung hochladung");
    }
  }

  Future<void> uploadNotificationKalorien(DateTime dateheute) async {
    try{
      final prefs = await SharedPreferences.getInstance();
      String? uid = prefs.getString('uid');
      String dateStr ="${dateheute.day.toString().padLeft(2, '0')}-${dateheute.month.toString().padLeft(2, '0')}-${dateheute.year}";
      if (uid == null) return;
      final docRef = FirebaseFirestore.instance
      .collection('notifications')
      .doc(uid);

      final docSnapshot = await docRef.get();

      if (!docSnapshot.exists) {
        await docRef.set({
    dateStr: FieldValue.arrayUnion([
      {
        'beschreibung': 'Sie sind 10,000 Schritte heute gelaufen . Weiter so !',
        'ziel': 'täglich schritte ziel erreicht!',
      }
    ])
  });
      }else {
        await docRef.update({
    dateStr: FieldValue.arrayUnion([
      {
        'beschreibung': 'Sie haben heute 500 Kalorien verbrennt ! Super',
        'ziel': 'Kalorien ziel erreicht!',
      }
    ])
  });
      }

  
      print("✅ kalorien ziel ist hochgeladet");

    }catch(e) {
      print("❌ Fehler ist aufgetreten");
    }
  }

  Future<void> uploadNotificationMotivation(DateTime dateheute) async {
    try{
      final prefs = await SharedPreferences.getInstance();
      String? uid = prefs.getString('uid');
      String dateStr ="${dateheute.day.toString().padLeft(2, '0')}-${dateheute.month.toString().padLeft(2, '0')}-${dateheute.year}";
      if (uid == null) return;
      final docRef = FirebaseFirestore.instance
      .collection('notifications')
      .doc(uid);

      final docSnapshot = await docRef.get();

      if (!docSnapshot.exists) {
        await docRef.set({
    dateStr: FieldValue.arrayUnion([
      {
        'beschreibung': 'Ein kurzer Spaziergang nach dem Essen hilft um fit zu bleiben !',
        'ziel': 'Motivation Tipp!',
      }
    ])
  });
      }else {
        await docRef.update({
    dateStr: FieldValue.arrayUnion([
      {
        'beschreibung': 'Ein kurzer Spaziergang nach dem Essen hilft um fit zu bleiben !',
        'ziel': 'Motivation Tipp!',
      }
    ])
  });
      }

  
      print("✅ Motivation ist hochgeladet");

    }catch(e) {
      print("❌ fehler bei der benachrichtigung hochladung");
    }
  }

  Future<void> uploadNotificationWasser(DateTime dateheute) async {
    try{
      final prefs = await SharedPreferences.getInstance();
      String? uid = prefs.getString('uid');
      String dateStr ="${dateheute.day.toString().padLeft(2, '0')}-${dateheute.month.toString().padLeft(2, '0')}-${dateheute.year}";
      if (uid == null) return;
      final docRef = FirebaseFirestore.instance
      .collection('notifications')
      .doc(uid);

      final docSnapshot = await docRef.get();

      if (!docSnapshot.exists) {
        await docRef.set({
    dateStr: FieldValue.arrayUnion([
      {
        'beschreibung': 'vergess nicht 8 wasserbecher heute zu trinken !',
        'ziel': 'Erinnerung an die Wasseraufnahme!',
      }
    ])
  });
      }else {
        await docRef.update({
    dateStr: FieldValue.arrayUnion([
      {
        'beschreibung': 'vergess nicht 8 wasserbecher heute zu trinken !',
        'ziel': 'Erinnerung an die Wasseraufnahme!',
      }
    ])
  });
      }

  
      print("✅ Wasseraufnahme ist hochgeladet");

    }catch(e) {
      print("❌ fehler bei der benachrichtigung hochladung");
    }
  }
}