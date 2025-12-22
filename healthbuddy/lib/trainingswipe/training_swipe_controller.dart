

import 'package:flutter/material.dart';
import 'package:swipable_stack/swipable_stack.dart';

class TrainingSwipePageController extends ChangeNotifier  {
  bool cardio = true ;
  final controllerSwipable = SwipableStackController();
  final List<Map<String, String>> trainingCards = [
    {
      'title': 'Physical Training',
      'subtitle': 'Increase your endurance and strength',
      'image': 'assests/physical_training.jpg',
      'duration': '8 Wochen',
      'tags': 'Cardio  •  Mobility'
    },
    {
      'title': 'Musculation',
      'subtitle': 'Build muscles and improve performance',
      'image': 'assests/training.jpg',
      'duration': '12 Wochen',
      'tags': 'Kraft  •  Technik'
    },
  ];

}