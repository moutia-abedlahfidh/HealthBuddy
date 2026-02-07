import 'package:flutter/material.dart';
import 'package:healthbuddy/Home/homescreen.dart';
import 'package:healthbuddy/chatbot/chatbot_screen.dart';
import 'package:healthbuddy/graphik/graphikcontroller.dart';
import 'package:healthbuddy/notifications/notificationscreen.dart';
import 'package:healthbuddy/settings/settings_screen.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class GrafikScreen extends StatelessWidget {
  const GrafikScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Aktivitätsübersicht",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ChangeNotifierProvider(create: (_)=> GraphikController()
      ,child: Consumer<GraphikController>(builder: (context, controller, child) {
        return controller.isLoading ==false ? Column(
          children: [
            Expanded(child: 
            PageView(
              controller: controller.pageController,
          pageSnapping: true,
          children:  [
            pageViewElement(option: 0,),
            pageViewElement(option: 1,),
            pageViewElement(option: 2,),
          ],
        )),
        const SizedBox(height: 5),

                Padding(
        padding: const EdgeInsets.only(bottom: 100), 
        child: SmoothPageIndicator(
          controller: controller.pageController,
          count: 3,
          effect: const WormEffect(
            dotHeight: 10,
            dotWidth: 10,
            activeDotColor: Colors.indigo,
          ),
        ),
      )
,

          ],
        ) : GrafikShimmer();
      },)),bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey.shade400,
          type: BottomNavigationBarType.fixed,
          currentIndex: 1,
          onTap: (index) {
            if (index==3) {
              Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  SettingsScreen()),
        );
            }else if (index == 2) {
              Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  ChatPage()),
        );
              }else if (index==0) {
              Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  Homescreen()),
        );
            }else  {

            }
          },
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Statistik'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'ChatBot'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Einstellungen'),
          ],
        ),
      ),
    );
  }
}

// --- Hilfs-Widgets ---

// Widget für die Zusammenfassungs-Zeilen
class SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final String unit;
  final IconData icon;
  final Color color;

  const SummaryRow({
    super.key,
    required this.label,
    required this.value,
    required this.unit,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade700,
            ),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          unit,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade500,
          ),
        ),
      ],
    );
  }
}


// ignore: must_be_immutable
class pageViewElement extends StatelessWidget {
  int option ;
  pageViewElement({super.key,required this.option}) ;

  @override
  Widget build(BuildContext context)  {
    final controller = Provider.of<GraphikController>(context);
    return Padding(padding: const  EdgeInsets.only(top: 16,left: 16,right: 16),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[


            // 2. Wochen-Visualisierung (Liniendiagramm Platzhalter)
            Text(
              option==0 ? "Wochen-Aktivität (Schritte)" : option==1 ? "Wochen-Aktivität (Kalorien)" : "Wochen-Aktivität (laufen)",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade800,
              ),
            ),
            const SizedBox(height: 12.0),
            
            // Platzhalter für das tatsächliche Diagramm
            chartPlaceholder(data: controller.thisweek,option: option,),
            
            const SizedBox(height: 24.0),

            // 3. Wochenzusammenfassung (Bottom Cards)
            Text(
              "Wochen-Zusammenfassung",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade800,
              ),
            ),
            const SizedBox(height: 12.0),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: option == 0 ? 
                  SummaryRow(
                    label: "Gesamtschritte (7 Tage)",
                    value: controller.totalSteps.toString(),
                    unit: "Schritte",
                    icon: Icons.directions_run,
                    color: Colors.indigo.shade400,
                  ) : option == 1 ?SummaryRow(
                    label: "Gesamtkalorienverbrauch",
                    value: controller.totalCalories.toStringAsFixed(0),
                    unit: "kcal",
                    icon: Icons.bolt,
                    color: Colors.redAccent.shade100,
                  ) : SummaryRow(
                    label: "Gesamt km",
                    value: controller.totalCalories.toStringAsFixed(0),
                    unit: "km",
                    icon: Icons.map,
                    color: Colors.orange.shade400,
                  ),
                   
                
            )

          ],
        ));
    }
} 



// Platzhalter-Widget für die Chart-Visualisierung
class chartPlaceholder extends StatelessWidget {
  final List<DailyData> data;
  final int option ;
  GraphikController controller = GraphikController() ;

   chartPlaceholder({super.key, required this.data,required this.option});

  @override
  Widget build(BuildContext context) {
    // Simuliert eine einfache Balkenansicht
    double maxSteps = data.isEmpty
    ? 0.0
    : data.map((d) => option==0? d.steps : (option==1 ? d.calories : d.km)).reduce((a, b) => a > b ? a : b).toDouble();


    return Container(
      height: 250,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.indigo.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: data.map((d) {
                // Skaliert die Höhe des Balkens relativ zum maximalen Schrittwert
                var value = option == 0 ? d.steps : (option==1 ? d.calories : d.km);
                // Ensure maxSteps is not zero
                double safeMax = maxSteps > 0 ? maxSteps : 1;

                // Calculate bar height
                double barHeight = (value / safeMax) * 150;

                // Optional: make sure the bar has a minimum height if value > 0
                if (value > 0 && barHeight < 5) {
                  barHeight = 5;
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${option==0 ? d.steps : (option==1 ? d.calories : d.km)}',
                      style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      width: 20,
                      height: barHeight,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade300,
                        borderRadius: BorderRadius.circular(4),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.blue.shade600,
                            Colors.blue.shade300,
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(controller.getDayName(controller.parseDate(d.day)), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class GrafikShimmer extends StatelessWidget {
  const GrafikShimmer({super.key});

  Widget shimmerBox({double height = 20, double width = double.infinity, double radius = 12}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // --- TOP CARDS ---
        Row(
          children: [
            Expanded(
              child: shimmerBox(height: 120),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: shimmerBox(height: 120),
            ),
          ],
        ),
        const SizedBox(height: 24),

        // --- TITLE ---
        shimmerBox(width: 180, height: 20),
        const SizedBox(height: 12),

        // --- CHART PLACEHOLDER ---
        shimmerBox(height: 250, radius: 16),
        const SizedBox(height: 24),

        // --- SUMMARY TITLE ---
        shimmerBox(width: 200, height: 20),
        const SizedBox(height: 12),

        // --- SUMMARY CARD ---
        shimmerBox(height: 140, radius: 16),
      ],
    );
  }
}

