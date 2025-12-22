
import 'package:flutter/material.dart';
import 'package:healthbuddy/home/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'details_service.dart';

class DetailsController extends ChangeNotifier {
  double height = 75.0;
  int alt = 20 ;
  int weight = 60 ;
  bool man_is_selected = true ;
  String? uid ;
  DetailsService servie = DetailsService();
  DetailsController() {
    getuid();
  }
  Future<void> getuid() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    uid = prefs.getString('uid') ;
  }
  void setHeight(double newValue) {
    height = double.parse(newValue.toStringAsFixed(1)) ;
    notifyListeners();
  }
  void changeVisinbility() {
    man_is_selected = !man_is_selected ;
    print(man_is_selected);
    notifyListeners();
  }
  void changeAlt(bool plus) {
    if (plus) {
      alt += 1 ;
    }else {
      alt -=1 ;
    }
    notifyListeners();
  }
  void changeWeight(bool plus) {
    if (plus) {
      weight += 1 ;
    }else {
      weight -=1 ;
    }
    notifyListeners();
  }

  void updateUser(BuildContext context) async {
    String ? result ;
    if (man_is_selected) {
      result = await servie.addDetails(uid, 'mannlich', alt, weight, height);
    }else {
      result = await servie.addDetails(uid, 'weiblich', alt, weight, height);
    }
    if (result == null) {
      Navigator.push(context,MaterialPageRoute(builder: (context) => const Homescreen()));
    }else {
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(result),backgroundColor: Colors.red,),
    );
    }
  }
}