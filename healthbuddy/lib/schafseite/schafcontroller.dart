

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:healthbuddy/schafseite/schlafservice.dart';

class Sclafcontroller extends ChangeNotifier {
  bool aufzeichnung = false ;
  bool isLoading = true ;
  Timer? _timer;
  Duration _duration = Duration.zero;
  schlafService service = schlafService() ;
  List<dynamic> schlafaufzeichnung = [];


  Sclafcontroller() {
    isLoading = true ;
    init() ;
  }

  void init() async{
    var response = await service.getInfo() ;
    schlafaufzeichnung = response['schlafzeit'];
    isLoading = false ;
    notifyListeners();
  }

  void counterstoppen() {
    aufzeichnung = false ;
    final now = DateTime.now();
    _timer?.cancel();
    _timer = null ;
    service.sendInfo(now,_duration);
    notifyListeners(); 
  }

  void counterstarten() {
    _duration = Duration.zero;
    aufzeichnung = true ;
    notifyListeners();
    if (_timer != null) return ; //wenn der timer funktioniert , machen wir nichts
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) { 
        _duration += const Duration(minutes: 1);
    });
  }
}