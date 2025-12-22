import 'package:flutter/material.dart';
class CardioController extends ChangeNotifier {

  /// CATEGORY DATA
  final Map<String, List<Map<String, String>>> categories = {
    "GANZKÖRPER-ZIRKEL": [
      {
        "title": "Jump Squats",
        "subtitle": "Beine, Po, Ausdauer",
        "gif":
            "https://homeworkouts.org/wp-content/uploads/anim-jump-squats.gif",
        "image": "https://fitnessvolt.com/wp-content/uploads/2020/04/jump-squats.png.webp"
      },
      {
        "title": "Mountain Climbers",
        "subtitle": "Bauch, Schultern, Ausdauer",
        "gif":
            "https://i.pinimg.com/originals/18/9f/d2/189fd2a368d038c31051dfe1060e9b1a.gif",
        "image": "https://training.fit/wp-content/uploads/2020/03/bergsteiger-fitnessband.png"
      },
      {
        "title": "Glute Bridge",
        "subtitle": "Rücken, Po",
        "gif":
            "https://homeworkouts.org/wp-content/uploads/anim-glute-bridges.gif",
        "image": "https://www.shutterstock.com/image-illustration/heel-glute-bridge-female-hips-260nw-2599477503.jpg"
      }
    ],
    "OBERKÖRPER": [
      {
        "title": "Liegestütze",
        "subtitle": "Brust & Trizeps",
        "gif":
            "https://i.pinimg.com/originals/b0/da/7f/b0da7f7f3556befcc7cbdd0ba33be39e.gif",
        "image": "https://www.fitnessstudio.org/wp-content/uploads/2016/12/liegestuetze.png"
      },
      {
        "title": "Pike Push Ups",
        "subtitle": "Schultern",
        "gif":
            "https://modusx.de/wp-content/uploads/pike-push-ups-schwer.gif",
        "image": "https://www.burnthefatinnercircle.com/members/images/2001b.png?cb=20250701051218"
      },
      {
        "title": "Schulter-Taps im Plank",
        "subtitle": "Schultern",
        "gif":
            "https://gymvisual.com/img/p/1/5/1/5/0/15150.gif",
        "image": "https://lyfta.app/images/exercises/38231301.png"
      },
      {
        "title": "Seitstütz (Plank seitlich)",
        "subtitle": "Bauch",
        "gif":
            "https://modusx.de/wp-content/uploads/ellenbogen-zum-knie-side-plank.gif",
        "image": "https://www.bodybuilding.de/wp-content/uploads/2024/09/Side-Plank-Fitnessuebung.webp"
      },
    ],
    "UNTERKÖRPER": [
      {
        "title": "Kniebeugen",
        "subtitle": "Beine & Po",
        "gif":
            "https://www.fitundattraktiv.de/wp-content/uploads/2018/01/kniebeugen_ausfuehrung.gif",
        "image": "https://training.fit/wp-content/uploads/2020/03/kniebeugen.png"
      },
      {
        "title": "Ausfallschritte",
        "subtitle": "Beine & Po",
        "gif":
            "https://media.tenor.com/sZ7VwZ6jrbcAAAAM/gym.gif",
        "image": "https://training.fit/wp-content/uploads/2020/03/ausfallschritt.png"
      },
      {
        "title": "Glute Bridge",
        "subtitle": "Gesäß & Rücken",
        "gif":
            "https://homeworkouts.org/wp-content/uploads/anim-glute-bridges.gif",
        "image": "https://www.shutterstock.com/image-illustration/heel-glute-bridge-female-hips-260nw-2599477503.jpg"
      },
      {
        "title": "Wadenheben",
        "subtitle": "Waden & Beine",
        "gif":
            "https://www.fitundattraktiv.de/wp-content/uploads/2017/10/wadenmuskulatur_aufbauen-wadenheben_stehend_mit_kurzhanteln.gif",
        "image": "https://training.fit/wp-content/uploads/2020/03/wadenheben-langhantel-stehend-2.png"
      },
    ],
    "BAUCH + RÜCKEN": [
      {
        "title": "Russian Twist",
        "subtitle": "Bauchschrägen",
        "gif":
            "https://www.kettlebellkings.com/cdn/shop/articles/russian-twist_cf5b5524-a334-4364-9cb9-54b5a04962d9.gif",
        "image": "https://liftmanual.com/wp-content/uploads/2023/04/russian-twist.jpg"
      },
      {
        "title": "Bicycle Crunches",
        "subtitle": "Bauch, Hüfte",
        "gif":
            "https://newlife.com.cy/wp-content/uploads/2019/02/00031301-air-bike-m_waist_FIX_360.gif",
        "image": "https://static.strengthlevel.com/images/exercises/bicycle-crunch/bicycle-crunch-800.jpg"
      },
    ],
  };

  List<Color> gradientColors = [
      Color(0xFFE0F7FA),
      Color(0xFFF1F8E9),
      Color(0xFFFFFFFF),
    ];



}