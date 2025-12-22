import 'package:flutter/material.dart';
import 'package:healthbuddy/detailssignup/details_controller.dart';
import 'package:provider/provider.dart';

class DetailsSignUp extends StatelessWidget {
  const DetailsSignUp({super.key}) ;
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create : (_)=> DetailsController(),
      child :Consumer<DetailsController>(
        builder: (context,controller,_) 
      {
        return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
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
            ]
            )
        ),
        child:  Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                 Row(
                  children:  [
                     geschlecht(imgGeschlecht: "assests/man_logo.png",geschlechtType: "Man", isSelected: controller.man_is_selected,),
                     SizedBox(width: 20,),
                     geschlecht(imgGeschlecht: "assests/weiblich-logo.png",geschlechtType: "Weiblich",isSelected: !controller.man_is_selected,)
                  ],
                ),
                const SizedBox(height: 50,),
                _InputWerte(kategorie: "Height",wert: controller.height.toString(),unity: "",verify: false,alt: false,),
                const SizedBox(height: 50,),
                Row(
                  children:[
                    _InputWerte(kategorie: "Weight",wert: controller.weight.toString(),unity: "kg",verify: true,alt: false,),
                    SizedBox(width: 10,),
                    _InputWerte(kategorie: "Alt",wert: controller.alt.toString(),unity: "",verify: true,alt: true,),
                  ],
                ),
                const SizedBox(height: 50,),
                ElevatedButton(
                    onPressed: () {
                      controller.updateUser(context);
                    }, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding:  const EdgeInsets.symmetric(
                          horizontal: 134, vertical: 15),
                      elevation: 5,
                    ),
                    child: const Text(
                      "Fortsetzen",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
              ],
            )
          ),
        ),
      ),
    );
      }));
  }


}

class _InputWerte extends StatelessWidget {
  final String kategorie;
  final String wert;
  final String unity;
  final bool verify;
  final bool alt ;

  const _InputWerte({
    required this.kategorie,
    required this.wert,
    required this.unity,
    required this.verify,
    required this.alt
  });

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<DetailsController>(context);
    return Container(
      width:  verify ? MediaQuery.of(context).size.width * 0.39 : MediaQuery.of(context).size.width * 0.8,
      height: 150,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            kategorie,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "$wert $unity",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          verify
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Roundbutton(icon:  Icons.remove, color : Colors.redAccent,alt :alt),
                    const SizedBox(width: 20),
                    Roundbutton(icon:Icons.add, color :Colors.green,alt :alt),
                  ],
                )
              : Slider(
                  min: 0,
                  max: 220,
                  activeColor: Colors.teal,
                  inactiveColor: Colors.teal.shade100,
                  thumbColor: Colors.teal,
                  value: controller.height,
                  onChanged: (value) {
                    controller.setHeight(value);
                  },
                ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class Roundbutton extends StatelessWidget{
  IconData icon ;
  Color color ;
  bool alt ;
  Roundbutton({super.key,required this.alt,required this.color,required this.icon}) ;
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<DetailsController>(context);
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: color),
        onPressed: () {
          if (alt) {
          if (color == Colors.green) {
            controller.changeAlt(true);
          }else {
            controller.changeAlt(false);
          }
        }else {
          if (color == Colors.green) {
            controller.changeWeight(true);
          }else {
            controller.changeWeight(false);
          }
        }
        },
      ),
    );
  }
  }



// ignore: camel_case_types
class geschlecht extends StatelessWidget {
  final String imgGeschlecht;
  final String geschlechtType;
  final bool isSelected ;

  const geschlecht({
    super.key,
    required this.imgGeschlecht,
    required this.geschlechtType,
    required this.isSelected
  });

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<DetailsController>(context);
    return ChangeNotifierProvider(create: (_)=> DetailsController(),
    child: GestureDetector(
      onTap: () {
        controller.changeVisinbility() ;
      },
      child: Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 180,
      decoration: BoxDecoration(
        color: isSelected ?Colors.grey : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imgGeschlecht, width: 80, height: 60),
          const SizedBox(height: 20),
          Text(
            geschlechtType,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    )
    ,),);
    }
}
