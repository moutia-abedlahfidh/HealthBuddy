import 'package:flutter/material.dart';
import 'package:healthbuddy/login/login_controller.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=>LoginController(),
    child: Consumer<LoginController>(
      builder: (context, controller, child) {
      return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFA8E6CF), 
              Color(0xFFDCE775), 
              Color(0xFFFFFFFF), 
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.favorite, color: Colors.green, size: 60),
                  const SizedBox(height: 10),
                  const Text(
                    "Gesundheit",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),

                  const SizedBox(height: 40),

                  const Text(
                    "Willkommen Wieder",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 40),

                  Image.asset(
                    "assests/login_logo.png", 
                    width: 200,
                    height: 120,
                  ),

                  const SizedBox(height: 50),

                  TextField(
                    controller: controller.email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Email eingeben',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      prefixIcon: Icon(Icons.email, color: Colors.green),
                    ),
                  ),
                  const SizedBox(height: 15),

                  TextField(
                    controller: controller.password,
                    obscureText: true,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Passwort eingeben',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      prefixIcon: Icon(Icons.lock, color: Colors.green),
                    ),
                  ),

                  const SizedBox(height: 30),

                  ElevatedButton(
                    onPressed: () {
                      controller.loginUser(context);
                      //Navigator.push(context,
                      //MaterialPageRoute(
                      //  builder: (context)=>const Home()
                      //)
                      //);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 15),
                      elevation: 5,
                    ),
                    child: const Text(
                      "Einloggen",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Bleiben Sie gesund und motiviert!",
                    style: TextStyle(
                      color: Colors.black54,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    },)
    );
    }
}
