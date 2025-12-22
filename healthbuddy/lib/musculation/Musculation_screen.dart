import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:healthbuddy/Musculation/Musculation_controller.dart';
import 'package:provider/provider.dart';

import 'Traininfo/Traininfo_screen.dart';

class MusculationScreen extends StatelessWidget {
  const MusculationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const gradientColors = [
              Color(0xFFE0F7FA),
              Color(0xFFF1F8E9),
            ];
    return ChangeNotifierProvider(create: (_) => MusculationController() ,
    child: Consumer<MusculationController>(builder: (context, controller, child) {
      return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              //begin: Alignment.topCenter,
              //end: Alignment.bottomCenter,
              colors: gradientColors, 
            ),
          ),
        ),
        title: const Text(
          "Krafttraining Übungen",
          style: TextStyle(
            color: Colors.teal,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.teal),
              onPressed: () => Navigator.pop(context),
            ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE0F7FA),
              Color(0xFFF1F8E9),
              Colors.white,
            ],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: controller.categories.entries.map((entry) {
            return _buildCategory(context , entry.key, entry.value);
          }).toList(),
        ),
      ),
    );
    },),);
    
    }

  Widget _buildCategory(BuildContext context , title, List<Map<String, String>> exercises) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        SizedBox(
  height: 240,
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: exercises.length,
    itemBuilder: (context, index) {
      return Container(
        width: 180, 
        margin: const EdgeInsets.only(right: 12),
        child: _exerciseCard(context,exercises[index]),
      );
    },
  ),
)

,

        const SizedBox(height: 20),
      ],
    );
  }

  Widget _exerciseCard(BuildContext context,Map<String, String> item) {
    return GestureDetector(
      child:Container(
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: CachedNetworkImage(
              imageUrl: item["image"]!,
              height: 150,
              width: double.infinity,
              fit: BoxFit.contain,
              placeholder: (_, __) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (_, __, ___) => const Icon(Icons.error),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  item["title"]!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item["subtitle"]!,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    )
   ,
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => TrainingsinfoScreen(gifImage: item["gif"] ?? "",name: item["title"] ?? "",subtitle: item["subtitle"] ?? "",)));
      },
    );
    }
}
