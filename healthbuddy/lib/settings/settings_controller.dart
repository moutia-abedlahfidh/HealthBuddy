

import 'package:flutter/material.dart';
import 'package:healthbuddy/body.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController extends ChangeNotifier {
  Future<void> ausloggen(BuildContext context) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('uid');
    Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Body()),
        );
  }
}