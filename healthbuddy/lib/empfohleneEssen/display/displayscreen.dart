import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:healthbuddy/home/homescreen.dart';

// ignore: must_be_immutable
class displayEssen extends StatelessWidget {
  Map<String,dynamic> list ;
  displayEssen({super.key,required this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          "Vorgeschlagene Speisen",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
              onPressed: () => Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Homescreen()),
    ),
            ),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Elementdisplay(list: list['Frühstück'],listName: "Frühstück",),
          Elementdisplay(list: list['Mittagessen'],listName: "Mittagessen",),
          Elementdisplay(list: list['Abendessen'],listName: "Abendessen",)
        ],
      ),),
      ),
    );
  }
}

// ignore: must_be_immutable
class Elementdisplay extends StatelessWidget {
  String listName ;
  Map<String,dynamic> list ;
  Elementdisplay({super.key,required this.listName,required this.list});

  @override 
  Widget build(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        margin: const EdgeInsets.only(top:15,bottom: 15),
        child: Text(
          listName,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 45, 89, 166),
          ),
        ),
      ),
      SizedBox(
        height: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            essenKategorie(context, list['speise1']),
            const SizedBox(width: 10),
            essenKategorie(context, list['speise2']),
            const SizedBox(width: 10),
            essenKategorie(context, list['speise3']),
          ],
        ),
      ),
    ],
  );
}


  Widget essenKategorie(BuildContext context, List item) {
  return Container(
    width: 150,
    height: 300,
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
            imageUrl: item[2] ?? '',
            height: 100,
            width: double.infinity,
            fit: BoxFit.cover,
            placeholder: (_, __) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (_, __, ___) => const Icon(Icons.error),
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  item[0] ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF2D59A6),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),

                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Kalorien : ${item[1] ?? ''}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blueAccent.shade700,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
      ],
    ),
  );
}

}