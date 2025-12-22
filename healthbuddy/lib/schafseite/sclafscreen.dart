import 'package:flutter/material.dart';
import 'package:healthbuddy/schafseite/schafcontroller.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class Schlafscreen extends StatelessWidget {
  const Schlafscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Sclafcontroller(),
      child: Consumer<Sclafcontroller>(
        builder: (context, controller, child) {
          return Scaffold(
            backgroundColor: const Color(0xFFD7D7D7),
            body: Container(
              decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromARGB(255, 232, 237, 246), 
          Color.fromARGB(255, 223, 228, 237),
          Color.fromARGB(255, 245, 246, 246), 
        ],
      ),
    ),
              child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: controller.isLoading ?_shimmerPlaceholder(): Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87, size: 26),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                const SizedBox(width: 10,),
                      const Text(
                      "Schlafübersicht",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _schlafAuszeichnung(value: controller.aufzeichnung,),
                    _schlafberechnungenanzeigen(context),
                    tippContainer()
                  ],
                ),
              ),
            ),
            ),
          );
        },
      ),
    );
  }

  

  Widget _schlafberechnungenanzeigen(context) {
    final controller = Provider.of<Sclafcontroller>(context);
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const Text(
            "Schlafstunden der letzeten Tagen",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 15),

          SizedBox(
        height: 200,
        child: ListView.builder(
          itemCount: controller.schlafaufzeichnung.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
              mainAxisAlignment:  MainAxisAlignment.spaceAround,
              children: [
                Text("${(controller.schlafaufzeichnung[index])['date']}",
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                ),),
                Text(
            "${(controller.schlafaufzeichnung[index])['duration']}",
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
              ],
            ),
            const SizedBox(height: 4,),
            Container(
  height: 1,
  width: double.infinity,
  color: Colors.grey.shade400,
),
              ],
            );
          }, ),
      )
          

        ],
      ),
    );
  }

  Widget _shimmerPlaceholder() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 30, width: 200, color: Colors.white),
          const SizedBox(height: 20),
          Container(height: 150, width: double.infinity, color: Colors.white),
          const SizedBox(height: 20),
          Container(height: 200, width: double.infinity, color: Colors.white),
          const SizedBox(height: 20),
          Container(height: 80, width: double.infinity, color: Colors.white),
        ],
      ),
    );
  }

  Widget tippContainer() {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.only(top: 10),
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: const Color(0xFFE5F3FF),   // hellblau
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Lightbulb Icon
        const Icon(
          Icons.lightbulb_outline,
          color: Color(0xFF1A73E8),     // soft blue icon
          size: 28,
        ),
        const SizedBox(width: 12),

        // Text
        Expanded(
          child: RichText(
            text: const TextSpan(
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                height: 1.4,
              ),
              children: [
                TextSpan(
                  text: "Tipp: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: "8 Stunden Schlaf passen dir am besten",
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}


}


class _schlafAuszeichnung extends StatelessWidget {
  final bool value ;
  _schlafAuszeichnung({super.key,required this.value}) ;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<Sclafcontroller>(context);
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Schlafzeit berechnen",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 15),

          GestureDetector(
            onTap: () {
              if (value==false) {
                controller.counterstarten();
              }else {
                controller.counterstoppen();
              }
            },
            child: Container(
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: value==false ? const Color(0xFF3898E6) : Colors.red,
              ),
              child: Center(
                child: Text(
                  value==false ? "⏰ Schlafzeit starten" : " 🕒 Schlafzeit stoppen",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 15),

          Text(
            "Letzter Schlaf: ${controller.schlafaufzeichnung.last['duration'] ?? "00 h 00 min"}",
            style: const TextStyle(
              color: Color(0xFFB9B9B9),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}