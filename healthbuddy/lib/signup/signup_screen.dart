import 'package:flutter/material.dart';
import 'package:healthbuddy/login/login_screen.dart';
import 'package:provider/provider.dart';

import 'signup_controller.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignupController(),
    child: Consumer<SignupController>(
      builder: (context, controller, child){
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
                    "Registrieren",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 30),

                  TextField(
                    controller: controller.name,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      prefixIcon: Icon(Icons.person, color: Colors.green),
                    ),
                  ),
                  const SizedBox(height: 15),

                TextField(
                  controller: controller.email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Email',
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
                    decoration: const  InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      prefixIcon: Icon(Icons.lock, color: Colors.green),
                    ),
                  ),
                  const SizedBox(height: 15),

                  TextField(
                    obscureText: true,
                    controller: controller.widerholenpassword,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Wiederholen Sie Ihr Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      prefixIcon: Icon(Icons.lock_outline, color: Colors.green),
                    ),
                  ),
                  const SizedBox(height: 30),

                  ElevatedButton(
                    onPressed: () {
                      controller.registerUser(context);
                      //Navigator.push(context,
                      //MaterialPageRoute(
                      //  builder: (context)=>const DetailsSignUp()
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
                      "Registrieren",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  Column(
                    children:  [
                       const Text(
                    "Haben Sie schon einen Konto",
                    style: TextStyle(
                      color: Colors.black54,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen()));
                    },
                    child: const Text(
                    "Login Sie ein",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      }
    ));
    }
}
