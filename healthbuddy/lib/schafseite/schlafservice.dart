import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class schlafService {

  Future<void> sendInfo(DateTime now , Duration duration) async{
    try{
      final prefs = await SharedPreferences.getInstance();
      String? uid = prefs.getString('uid');
      String durationStr = "${duration.inHours.toString().padLeft(2,'0')} h ${(duration.inMinutes % 60).toString().padLeft(2,'0')} min";
      String dateStr ="${now.day.toString().padLeft(2, '0')}-${now.month.toString().padLeft(2, '0')}-${now.year}";
      await FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .update({
        'schlafzeit': FieldValue.arrayUnion([
        {
          'date': dateStr,
          'duration': durationStr,
        }])
      });
    }catch(e) {
      print("Something went wrong.$e");
    }
  }

  Future<dynamic> getInfo() async {
    try{
      final prefs = await SharedPreferences.getInstance();
      String? uid = prefs.getString('uid');
      final response = await FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .get() ;

      return response ;
    }catch(e) {
      print("Something went wrong.$e");
    }
  }
}