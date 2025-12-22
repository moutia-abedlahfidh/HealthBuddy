import 'package:flutter/material.dart';
import 'package:healthbuddy/kalorienaufnahmen/kalorien_controller.dart';
import 'package:provider/provider.dart';

import 'produkt_detail_screen.dart';


class KalorienScreen extends StatelessWidget {
  const KalorienScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const gradientColors = [
      Color(0xFFE0F7FA),
      Color(0xFFF1F8E9),
      Color(0xFFFFFFFF),
    ];
    //final controller = Provider.of<KalorienController>(context);
    return ChangeNotifierProvider(
      create: (_) => KalorienController(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: gradientColors, 
            ),
          ),
        ),
        title: const Text(
          "Kalorien Übersicht",
          style: TextStyle(
            color: Colors.teal,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: gradientColors, 
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.teal),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),

        body: Builder(builder: (context)  {
          final controller = Provider.of<KalorienController>(context);
          return Container(
          padding: const EdgeInsets.all(10),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: gradientColors
            )
        ),
        child: Column(
          children: [
            const SizedBox(height: 80,),
            Consumer<KalorienController>(
        builder: (context, controller, _) => SearchBar(
          leading: const Icon(Icons.search),
          hintText: "Such Kalorien deines Artikels",
          onChanged: (value) {
            controller.searchFood(value);
          },
        ),
      ),
      controller.foods.isNotEmpty ? Expanded(
  child: Consumer<KalorienController>(
    builder: (context, controller, _) {
      if (controller.foods.isNotEmpty) {
        return ListView.builder(
          itemCount: controller.foods.length,
          itemBuilder: (context, index) {
            final item = controller.foods[index];
            return Card(
              child: ListTile(
                leading: const Icon(Icons.fastfood, color: Colors.teal),
                title: Text(item['food_name'] ?? ''),
                subtitle: Text(item['food_description'] ?? ''),
              ),
            );
          },
        );
      }

      // ✅ Case 2: no results yet → empty box or your default UI
      return const SizedBox(); // or a loading, or your static grid
    },
  ),
) :
            const SizedBox(height: 20,),
            const Expanded(child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Wrap(
                alignment: WrapAlignment.start,
              spacing: 10,
              runSpacing: 10,
              children: [
                KardEssen(image: "assests/milka.png",title:"Milka Alpenmilch" ,kalorien: "ca. 539 kcal pro 100 g",),
                KardEssen(image: "assests/mayo.jpg",title:"Mayonnaise" ,kalorien: "ca. 705 kcal pro 100 g",),
                KardEssen(image: "assests/reis.jpg",title:"Basmati Reis" ,kalorien: "ca. 353 kcal pro 100 g",),
                KardEssen(image: "assests/spagetti.jpg",title:"Spaghetti" ,kalorien: "ca. 158 kcal pro 100 g",),
                KardEssen(image: "assests/ketchup.jpg",title:"Ketchup" ,kalorien: " 41 kcal pro 100 ml",),
                KardEssen(image: "assests/kinder_bueno.png",title:"Kinder Bueno" ,kalorien: "ca. 572 kcal pro 100 g",),
                KardEssen(image: "assests/Alpia_Noisette.png",title:"Alpia Noisette" ,kalorien: "ca. 559 kcal pro 100 g",),
                KardEssen(image: "assests/Cookies_Haselnuss.jpg",title:"Cookies Haselnuss" ,kalorien: "ca. 513 kcal pro 100 g",),
                KardEssen(image: "assests/Kinder_crunchy_cookies.jpg",title:"Kinder crunchy cookies" ,kalorien: "ca. 539 kcal pro 100 g",),
              ],
            ),
            ))
          ],
        )
        );
        })
      ),
    ) ;
  }
}

class KardEssen extends StatelessWidget {
  final String image ;
  final String kalorien ;
  final String title ;
  const KardEssen({super.key,required this.image,required this.title,required this.kalorien});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProduktDetailScreen(
              name: title,
              kalorien: kalorien,
              image: image,
            ),
          ),
        );
      },
      child: Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 200,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10,),
          Image.asset(
              image, 
              fit: BoxFit.contain,
              height: 100,
              width: 180,
            ),

           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  kalorien,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    );
  }
}