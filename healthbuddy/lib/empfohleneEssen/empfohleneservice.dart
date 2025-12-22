

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';

class empfohleneservice {

  Future<dynamic> getPrediction(List<double> Features) async{
      final Dio _dio = Dio();
    String url = 'https://flutter-production-6867.up.railway.app/predict?feature1=${Features[0]}&feature2=${Features[1]}&feature3=${Features[2]}&feature4=${Features[3]}&feature5=${Features[4]}' ;
    try{
      final response = await _dio.get(url)  ;
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return "Server error: ${response.statusCode}";
      }
    }catch(e) {
      return "Something went wrong.";
    }
  }


  Future<dynamic> vorschlagSpeichen(String type) async{
    try{
      var instance = await FirebaseFirestore.instance
      .collection('speichen')
      .doc(type)
      .get();
      return instance ;
    }catch(e) {
      return "Something went wrong.";
    }
  }
}