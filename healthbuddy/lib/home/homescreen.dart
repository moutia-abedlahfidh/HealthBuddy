import 'package:flutter/material.dart';
import 'package:healthbuddy/graphik/graphikscreen.dart';
import 'package:healthbuddy/home/homecontroller.dart';
import 'package:healthbuddy/kalorienaufnahmen/kalorien_screen.dart';
import 'package:healthbuddy/chatbot/chatbot_screen.dart';
import 'package:healthbuddy/schafseite/sclafscreen.dart';
import 'package:healthbuddy/settings/settings_screen.dart';
import 'package:healthbuddy/trainingswipe/training_swipe_screen.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:healthbuddy/empfohleneEssen/empfohlenescreen.dart' ;


class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override 
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_)=> Homecontroller(),
    child: Consumer<Homecontroller>(builder: (context, controller, child) {
      return Scaffold(
      body: controller.isLoading
    ? const FullPageShimmer()
    :Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Home",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Hallo, ${controller.useraktif.name} 👋",
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 19),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       const Text(
                        "Gespeicherte Daten",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                       const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:  [
                          _DataItem(title: "Alter", value: "${controller.useraktif.alt}"),
                          _DataItem(title: "Gewicht", value: "${controller.useraktif.gewicht} kg"),
                          _DataItem(title: "Größe", value: "${controller.useraktif.grose} cm"),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                const Text(
                  "🏃‍♀️ Deine Schritte heute 👣",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 14),
                Container(
  width: double.infinity,
  padding: const EdgeInsets.all(20),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(18),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 8,
        offset: Offset(0, 4),
      ),
    ],
  ),
  child: Row(
    children: [
      Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blueAccent.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.directions_walk,
          color: Colors.blueAccent,
          size: 30,
        ),
      ),

      const SizedBox(width: 20),

       Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Schritte zählen",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "${controller.steps} Schritte",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "Tagesziel: 10.000 Schritte",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),

      Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 55,
            height: 55,
            child: CircularProgressIndicator(
              value: controller.steps / 10000,
              strokeWidth: 6,
              backgroundColor: Colors.grey.shade200,
              color: Colors.blueAccent,
            ),
          ),
          Text(
            "${(controller.steps * 100)/10000}%",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ],
      ),
      
      
    ],
  ),
)
,               // Kilometer Widget
    const SizedBox(height: 14),

    Row(
              children: <Widget>[
                Expanded(
                  child: MetricCard(
                    title: "Kilometer  (Heute)",
                    value: controller.km.toStringAsFixed(1),
                    unit: "km",
                    icon: Icons.map,
                    color: Colors.orangeAccent,
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: MetricCard(
                    title: "Kalorien (Heute)",
                    value: controller.kcal.toStringAsFixed(1),
                    unit: "kcal",
                    icon: Icons.local_fire_department,
                    color: Colors.redAccent.shade100,
                  ),
                ),
              ],
            ),

    const SizedBox(height: 14),

                const SizedBox(height: 20),
                const Text(
                  "Deine Kategorien",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),

                Align(alignment: Alignment.center,
                child: Wrap(
                  spacing: 38,
                  runSpacing: 20,
                  children: [
                    _FeatureCard(
                      title: "Training",
                      image: "assests/training.jpg",
                      color: Colors.blueAccent.shade100,
                      page : const TrainingSwipePageScreen()
                    ),
                    _FeatureCard(
                      title: "Kalorienaufnahme",
                      image: "assests/kalorien.jpg",
                      color: Colors.greenAccent.shade100,
                      page :  const KalorienScreen()
                    ),
                    _FeatureCard(
                      title: "Empfohlene Ernährung",
                      image: "assests/ernahrung.jpg",
                      color: Colors.greenAccent.shade100,
                      page : AIProgressPage()
                    ),
                    _FeatureCard(
                      title: "Schlaf",
                      image: "assests/schlaf.jpg",
                      color: Colors.indigoAccent.shade100,
                      page : const Schlafscreen()
                    ),
                  ],
                ),),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey.shade400,
          type: BottomNavigationBarType.fixed,
          currentIndex: 0,
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
              }else if (index==1) {
              Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GrafikScreen()),
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
    },),);
  }
  Widget kmWidget(int steps) {
  final km = (steps * 0.0008); // ~ 1 Schritt = 0.8 Meter
  final kmGoal = 8.0; // z.B. Tagesziel 8 km
  final progress = (km / kmGoal).clamp(0.0, 1.0);

  return Container(
    width: double.infinity,
  padding: const EdgeInsets.all(20),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(18),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 8,
        offset: Offset(0, 4),
      ),
    ],
  ),
    child: Row(
    children: [
      Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.orangeAccent.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.map,
          color: Colors.orangeAccent,
          size: 30,
        ),
      ),
      const SizedBox(width: 20),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Gelaufene Kilometer",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "${km.toStringAsFixed(2)} km",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "Tagesziel: ${kmGoal.toStringAsFixed(1)} km",
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),

      Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 55,
            height: 55,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 6,
              backgroundColor: Colors.grey.shade200,
              color: Colors.orangeAccent,
            ),
          ),
          Text(
            "${(progress * 100).toStringAsFixed(0)}%",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ],
      )
    ],
  )
,
  );}
Widget kalorienWidget(int steps) {
  final kcal = steps * 0.045;
  final kcalGoal = 300.0;
  final progress = (kcal / kcalGoal).clamp(0.0, 1.0);

  return Container(
    width: double.infinity,
  padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(18),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 8,
        offset: Offset(0, 4),
      ),
    ],
  ),
    child: Row(
    children: [
      Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.redAccent.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.local_fire_department,
          color: Colors.redAccent,
          size: 30,
        ),
      ),
      const SizedBox(width: 20),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Verbrannte Kalorien",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "${kcal.toStringAsFixed(0)} kcal",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "Tagesziel: ${kcalGoal.toStringAsFixed(0)} kcal",
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),

      Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 55,
            height: 55,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 6,
              backgroundColor: Colors.grey.shade200,
              color: Colors.redAccent,
            ),
          ),
          Text(
            "${(progress * 100).toStringAsFixed(0)}%",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ],
      )
    ],
  )
,
  );}

}


class _DataItem extends StatelessWidget {
  final String title;
  final String value;

  const _DataItem({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.black54, fontSize: 16),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final String title;
  final String image;
  final Color color;
  final Widget page ;

  const _FeatureCard({
    required this.title,
    required this.color,
    required this.image,
    required this.page
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,MaterialPageRoute(builder: (context) => page));
      },
      child: Container(
      width: 140,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              image, 
              fit: BoxFit.cover,
            ),

            Container(
              color: Colors.white.withOpacity(0.4), 
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Icon(icon, size: 40, color: Colors.black87),
                const SizedBox(height: 4),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    );
  }
}


class FullPageShimmer extends StatelessWidget {
  const FullPageShimmer({super.key});

  Widget shimmerBox({double height = 120}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: double.infinity,
        height: height,
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: 130,
              height: 28,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 15),

          // Subtitle
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: 200,
              height: 22,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 30),

          // Saved data card
          shimmerBox(height: 120),

          // Steps
          shimmerBox(height: 120),

          // KM
          shimmerBox(height: 120),

          // Kcal
          shimmerBox(height: 120),

          const SizedBox(height: 20),

          // Kategorie title
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: 180,
              height: 26,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 20),

          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              shimmerBox(height: 120),
              shimmerBox(height: 120),
              shimmerBox(height: 120),
              shimmerBox(height: 120),
            ],
          )
        ],
      ),
    );
  }
}

// Widget für die Kennzahlen-Karten oben
class MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final IconData icon;
  final Color color;

  const MetricCard({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: color.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(icon, color: color, size: 30),
          const SizedBox(height: 8.0),
          Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(width: 4),
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(
                  unit,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
