

import 'package:flutter/material.dart';

class TrainInfoController extends ChangeNotifier {
  int widerholungs = 1 ;
  int satze = 1 ;
  int pausemin = 1 ;
  int pausesec = 59 ; 
  bool programStar = false ;
  

  void updateexercice() {
    programStar = true ;
    startexercice() ;
  }
  void startexercice()async {
    if (programStar == true ) {
      if (satze == 4) {
      programStar = false ;
      satze =1 ;
      widerholungs = 1 ;
      pausemin = 1;
      pausesec = 59 ;
      notifyListeners();
      return ;
    }else {
      if (widerholungs==30) {
        startpause();
      }else{
      widerholungs ++ ;
      await Future.delayed(const Duration(seconds: 1));
      startexercice();
      }
    }
    notifyListeners();
    }
    
  }
  void startpause() async {
  if (programStar == true) {
    if (pausemin == 0 && pausesec == 0) {
    widerholungs = 1;
    satze++;

    pausemin = 1; 
    pausesec = 59;
    widerholungs = 1 ;
    startexercice();
    notifyListeners();
    return;
  }

  if (pausesec == 0) {
    pausemin--;
    pausesec = 59;
  } else {
    pausesec--;
  }
  notifyListeners();

  await Future.delayed(const Duration(seconds: 1));
  startpause();  
  }

}

  void endexercice() {
    programStar = false ;
    pausemin = 1; 
    pausesec = 59;
    widerholungs = 1 ;
    satze = 1 ;
    notifyListeners();
  }

}