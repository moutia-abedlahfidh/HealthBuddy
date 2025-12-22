import 'package:flutter/material.dart';
import 'package:healthbuddy/cardio/cardioscreen.dart';
import 'package:provider/provider.dart';
import 'package:swipable_stack/swipable_stack.dart';

import '../musculation/Musculation_screen.dart';
import 'training_swipe_controller.dart';

class TrainingSwipePageScreen extends StatefulWidget {
  const TrainingSwipePageScreen({super.key});

  @override
  State<TrainingSwipePageScreen> createState() => _TrainingSwipePageState();
}

class _TrainingSwipePageState extends State<TrainingSwipePageScreen> {
  final controller = SwipableStackController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) => TrainingSwipePageController(),
    child: Consumer<TrainingSwipePageController>(builder: (context,controller,_) {
      return Scaffold(

      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE0F7FA),
              Color(0xFFF1F8E9),
              Color(0xFFFFFFFF),
            ],
          ),
        ),
        child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Stack(
            children: [
              Positioned(
                  top: 10,
                  left: 0,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87, size: 26),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              Align(
            alignment: Alignment.center,
            child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: SwipableStack(
            controller: controller.controllerSwipable,
            onSwipeCompleted: (index, direction) {
              debugPrint('Card $index swiped $direction');
              if (index%2 == 0 ) {
                controller.cardio = false ;
              }else {
                controller.cardio = true ;
              }
            },
            builder: (context, properties) {
              final item = controller.trainingCards[properties.index % controller.trainingCards.length];
              return _buildTrainingCard(item,controller.cardio );
            },
          ),
          ),
          )
            ],
          ),
        ),
      ),
      ),
    );
    },),);}

  Widget _buildTrainingCard(Map<String, String> item,bool cardio) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,MaterialPageRoute(builder: (context) => cardio ? const CardioScreen() : const MusculationScreen()));
      },
      child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            item['image']!,
            fit: BoxFit.cover,
          ),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.center,
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.transparent,
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['duration']!,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  item['title']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  item['subtitle']!,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item['tags']!,
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    );}
}
