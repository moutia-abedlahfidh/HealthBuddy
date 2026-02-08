
import 'package:flutter/material.dart';
import 'package:healthbuddy/graphik/graphikservice.dart';
import 'package:healthbuddy/home/homescreen.dart';

class GraphikController extends ChangeNotifier {
  graphikService service = graphikService() ;
  final PageController pageController = PageController();
  bool isLoading  = true ;

  List<DailyData> fitnessData = [];
  List<DailyData> thisweek = [] ;

int totalSteps = 0;
  double totalCalories = 0.0;

  int todaySteps = 0;
  double todayCalories = 0.0;

  double todayKM = 0.0;

  GraphikController() {
    isLoading = false ;
    loadSteps();
    notifyListeners();
  }

  String getDayName(DateTime date) {
  const names = ["Mo", "Tu", "Wed", "Thu", "Fr", "Sa", "Su"];
  return names[date.weekday - 1];
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
      final sevenDaysAgo = now.subtract(const Duration(days: 7));

      return fitnessData.where((d) {
        final dayDate = parseDate(d.day); 
        return dayDate.isAfter(sevenDaysAgo);
      }).toList();
    }


  void loadSteps() async {
  var steps = await service.getSteps();
  for (var s in steps) {
      fitnessData.add(DailyData(s['date'],s['steps'],double.parse(s['kalorien'].toString()),double.parse(s['km'].toString())));
    }

      todaySteps = fitnessData.last.steps;
      todayCalories = fitnessData.last.calories;

      thisweek = thisWeekData() ;
      totalSteps = thisweek.fold(0, (sum, d) => sum + d.steps);
      totalCalories = thisweek.fold(0.0, (sum, d) => sum + d.calories);
      todayKM = thisweek.fold(0.0, (sum, d) => sum + d.km);
      notifyListeners();
}
}