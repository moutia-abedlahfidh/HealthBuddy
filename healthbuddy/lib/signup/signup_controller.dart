import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthbuddy/detailssignup/details_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'signup_service.dart';

class SignupController extends ChangeNotifier {
  SignUpService service = SignUpService() ;
  TextEditingController email  = TextEditingController();
  TextEditingController password =TextEditingController() ;
  TextEditingController widerholenpassword = TextEditingController();
  TextEditingController name  = TextEditingController();

  void registerUser(BuildContext context) async{
    if (email.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Email ist leer"),backgroundColor: Colors.red,),
    );
    }else if (name.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Name ist leer"),backgroundColor: Colors.red,),
    );
    }
    else if (password.text != widerholenpassword.text) {
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Wiederholtes Password und password sind nicht gleich"),backgroundColor: Colors.red,),
    );
    }else {
      String? result = await service.registerUser(name: name.text, email: email.text, password: password.text) ;
    if (result == null) {
      ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content:  Text('Konto Erfolgreich Ergestellt!'),backgroundColor: Colors.green,),
    );
    String uid = FirebaseAuth.instance.currentUser!.uid;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('uid', uid);
      Navigator.push(context,MaterialPageRoute(builder: (context) => const DetailsSignUp()));
    }else {
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(result),backgroundColor: Colors.red,),
    );
    }
    }
}
}