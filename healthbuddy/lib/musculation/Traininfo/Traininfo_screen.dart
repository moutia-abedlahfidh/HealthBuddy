import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Training_controller.dart';


class TrainingsinfoScreen extends StatelessWidget{
  final String gifImage ;
  final String name ;
  final String subtitle ;
  const TrainingsinfoScreen({super.key,required this.gifImage,required this.name,required this.subtitle}) ;

  @override
  Widget build(BuildContext context) {
    const gradientColors = [
              Color(0xFFE0F7FA),
              Color(0xFFF1F8E9),
            ];
    return ChangeNotifierProvider(
      create: (_) => TrainInfoController(),
      child: Consumer<TrainInfoController>(builder: (context, controller, child) {
        return Scaffold(
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
    "Übung Übersicht",
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  ),
        leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15,right: 15,top: 25),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              //begin: Alignment.topCenter,
              //end: Alignment.bottomCenter,
              colors: gradientColors, 
            ),
        ),
        height:double.infinity ,
        width: double.infinity,
        child: Column(
          children: [
            ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            child: CachedNetworkImage(
              imageUrl: gifImage,
              height: 270,
              width: double.infinity,
              fit: BoxFit.fill,
              placeholder: (_, __) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (_, __, ___) => const Icon(Icons.error),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(name,style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
      fontSize: 20,
          ),),
          ),
          const SizedBox(height: 8,),
           Align(
          alignment: Alignment.topLeft,
            child: Text(subtitle,style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w200,
      fontSize: 17,
          ),),
          ),
          const SizedBox(height: 18,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: CircularProgressIndicator(
              value: (controller.widerholungs)/30,
              strokeWidth: 4,
              backgroundColor: Colors.grey.shade200,
              color: Colors.blue,
            ),
          ),
          Text(
            "${controller.widerholungs}/30",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
      const Padding(padding: EdgeInsets.only(top: 10),
      child: Text("wiederholungen",textAlign: TextAlign.center,style: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.bold
      ),),)
                ],
              )
            ,
            Column(
                children: [
                  Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: CircularProgressIndicator(
              value: ((controller.pausemin * 60 + controller.pausesec) / 119),
              strokeWidth: 6,
              backgroundColor: Colors.grey.shade200,
              color: Colors.orange,
            ),
          ),
          Text(
            "${controller.pausemin}:${controller.pausesec}",
            style:const  TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
      const Padding(padding: EdgeInsets.only(top: 10),
      child: Text("Pause",style: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.bold
      ),),)
                ],
              )
            ,
            Column(
                children: [
                  Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: CircularProgressIndicator(
              value: controller.satze/3,
              strokeWidth: 4,
              backgroundColor: Colors.grey.shade200,
              color: Colors.green,
            ),
          ),
           Text(
            "${controller.satze}/3",
            style:const  TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
      const Padding(padding: EdgeInsets.only(top: 10),
      child: Text("Sätze",style: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.bold
      ),),)
                ],
              )
            ,],
          )
          ,
          const SizedBox(height: 18,),
          const Text("Bitte starten Sie das Programm, damit die Wiederholungs-Sätze beginnen können. Nach jeder Wiederholung bekommen Sie eine Pause von 10 Minuten. Nach dieser Pause setzt das Programm automatisch fort.",style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),),
          const SizedBox(height: 18,),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                controller.programStar ? controller.endexercice() :controller.updateexercice();
              },
              child: Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: controller.programStar ? Colors.red : Colors.green
            ),
            child:Text(controller.programStar ? "End Program" : "Start Program",style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.normal
            ),),
          ),
            ),
          )
          ],
        ),
      ),
    )
    ;
      },));
  }
  
}