import 'package:flutter/material.dart';
import 'package:healthbuddy/empfohleneEssen/empfohlenecontroller.dart';
import 'package:provider/provider.dart';

class AIProgressPage extends StatelessWidget {
  const AIProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => empfohlenecontroller(context),
      child: Consumer<empfohlenecontroller>(
        builder: (context, controller, child) {
          return Scaffold(
            body: Stack(
              children: [

                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [
                        0.2 + controller.progress * 0.3,
                        0.8,
                      ],
                      colors: [
                        Color.lerp(Colors.blue.shade200, Colors.cyan.shade100, controller.progress)!,
                        Color.lerp(Colors.blue.shade900, Colors.deepPurple.shade700, controller.progress)!,
                      ],
                    ),
                  ),
                ),

                Positioned.fill(
                  child: IgnorePointer(
                    child: AnimatedOpacity(
                      opacity: 0.2 + controller.progress * 0.4,
                      duration: const Duration(milliseconds: 500),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: RadialGradient(
                            radius: 0.9,
                            colors: [
                              Colors.white.withOpacity(0.0),
                              Colors.white.withOpacity(0.4),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 140,
                        height: 140,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 140,
                              height: 140,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),


                            Text(
                              "${(controller.progress * 100).round()}%",
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 44, 44, 44),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 25),

                      Text(
                        controller.progress==0.0 ? 
                        "Processing..." : 
                        (controller.progress==0.5 ?
                        "Datan erfolgreich zur KI gesendt": 
                        (controller.progress == 0.75 ? 
                        "Datan erfolgreich von KI erhaltet":
                        "Programm ist vorbereitet anzuzeigen..." )),
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
