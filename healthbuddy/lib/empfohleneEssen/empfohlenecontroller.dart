import 'dart:async';
import 'package:flutter/material.dart';
import 'package:healthbuddy/empfohleneEssen/display/displayscreen.dart';
import 'package:healthbuddy/empfohleneEssen/empfohleneservice.dart';
import 'package:healthbuddy/graphik/graphikservice.dart';
import 'package:healthbuddy/settings/Edit/editservice.dart';

class empfohlenecontroller extends ChangeNotifier {
  empfohleneservice service = empfohleneservice() ;
  double progress = 0.0;
  List<double> parameters = [] ;
   List<DailyData> fitnessData = [];
  List<DailyData> thisweek = [] ;
  int todaySteps = 0;
  int totalStepsthisweek = 0;
  double totalCalories = 0.0;
  var _currentuser ;
  empfohlenecontroller(BuildContext context) {
    _init();
    Timer.periodic(const Duration(seconds: 1), (timer) { 
      progress += 0.25;
      if (progress >= 1.0) {
        progress = 1.0;
        timer.cancel(); 
        datenVerarbeitung(context);
      }

      notifyListeners();
    });
  }

  void _init() async{
  _currentuser = await EditService().getDetails(); 
  final data = _currentuser.data() as Map<String, dynamic>;
  parameters.add(double.parse(data['alt'].toString()));
  parameters.add(double.parse(data['gewicht'].toString()) );
  parameters.add(double.parse(data['grose'].toString()) );
  parameters.add(data['geschlecht']=='mannlich' ? 0 : 1);
  await loadSteps();
  parameters.add(totalStepsthisweek.toDouble());

  }

  void updateProgress(double value) {
      progress = value;
      notifyListeners();
  }

  DateTime parseDate(String dateString) {
  final parts = dateString.split('-'); 
  final day = int.parse(parts[0]);
  final month = int.parse(parts[1]);
  final year = int.parse(parts[2]);
  return DateTime(year, month, day);
}

  List<DailyData> thisWeekData() {
      final now = DateTime.now();
      print(now);
      final sevenDaysAgo = now.subtract(const Duration(days: 7));

      return fitnessData.where((d) {
        final dayDate = parseDate(d.day); 

        return dayDate.isAfter(sevenDaysAgo);
      }).toList();
    }

   Future<void> loadSteps() async {
  var steps = await graphikService().getSteps();
  for (var s in steps) {
      fitnessData.add(DailyData(s['date'],s['steps'],double.parse(s['kalorien'].toString()),double.parse(s['km'].toString())));
      print('date = ${s['date']} steps=${s['steps']}');
    }

      todaySteps = fitnessData.last.steps;

      thisweek = thisWeekData() ;
      totalStepsthisweek = thisweek.fold(0, (sum, d) => sum + d.steps);
      notifyListeners();
}

  void datenVerarbeitung(BuildContext context) async{
    var Empfohlenespeisen ;
    var datareceived ;
    var Result = await service.getPrediction(parameters);
    if (Result['prediction'] == 0) {
      datareceived = await service.vorschlagSpeichen('leicht') ;
      Empfohlenespeisen = datareceived.data() as Map<String, dynamic>;
    }else if (Result['prediction'] == 1) {
      Empfohlenespeisen = service.vorschlagSpeichen('Mittel');
    }else if (Result['prediction'] == 2 ){
      Empfohlenespeisen = service.vorschlagSpeichen('Stark');
    }else {
      print("ein Fehler wurde aufgetretn ");
    }

    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => displayEssen(list: Empfohlenespeisen as Map<String,dynamic>,)),
  );
  }
}

class DailyData {
  final String day;
  final int steps;
  final double calories;
  final double km ;

  DailyData(this.day, this.steps, this.calories,this.km);
}