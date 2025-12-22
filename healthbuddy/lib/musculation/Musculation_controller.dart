import 'package:flutter/material.dart';

class MusculationController extends ChangeNotifier {

  /// CATEGORY DATA
  final Map<String, List<Map<String, String>>> categories = {
    "GANZKÖRPER-ZIRKEL": [
      {
        "title": "Burpees",
        "subtitle": "Ganzkörper & Kraft",
        "gif":
            "https://fitnessprogramer.com/wp-content/uploads/2021/06/Dumbbell-Burpees.gif",
        "image": "https://liftmanual.com/wp-content/uploads/2023/04/dumbbell-burpee.jpg"
      },
      {
        "title": "Kettlebell Swing",
        "subtitle": "Beine, Rücken & Core",
        "gif":
            "https://media.tenor.com/0PlWgJxSNi0AAAAM/single-bd-swing-dumbbell-workout.gif",
        "image": "https://www.marathonfitness.de/wp-content/uploads/2023/05/kettlebell-swing-titel.jpg"
      },
      {
        "title": "Push Press",
        "subtitle": "Schultern & Arme",
        "gif":
            "https://fitnessprogramer.com/wp-content/uploads/2021/02/push-press-1.gif",
        "image": "https://liftmanual.com/wp-content/uploads/2023/04/push-press.jpg"
      }
    ],
    "OBERKÖRPER": [
      {
        "title": "Bankdrücken",
        "subtitle": "Brust & Trizeps",
        "gif":
            "https://www.fitundattraktiv.de/wp-content/uploads/2018/04/bankdruecken_maschine_enger_griff.gif",
        "image": "https://training.fit/wp-content/uploads/2018/11/bankdruecken-flachbank-langhantel-800x448.png"
      },
      {
        "title": "Bizeps-Curls",
        "subtitle": "Arme & Bizeps",
        "gif":
            "https://www.fitundattraktiv.de/wp-content/uploads/2018/03/muskelaufbau_bizeps-konzentrationscurls_mit_kurzhantel-1.gif",
        "image": "https://training.fit/wp-content/uploads/2020/02/bizepscurls-stehend-langhantel-800x448.png"
      },
      {
        "title": "Kurzhantel Schulterdrücken",
        "subtitle": "Schultern",
        "gif":
            "https://www.fitundattraktiv.de/wp-content/uploads/2017/04/schultertraining_mit_kurzhanteln-schulterdruecken_sitzend.gif",
        "image": "https://www.marathonfitness.de/wp-content/uploads/2023/10/kurzhantel-schulterdruecken-stehend-titel.jpg"
      },
      {
        "title": "Trizeps-Dips",
        "subtitle": "Trizeps & Brust",
        "gif":
            "https://www.fitundattraktiv.de/wp-content/uploads/2018/02/dips_ausfuehrung-trizeps_dips_geraet_kniend.gif",
        "image": "https://modusx.de/wp-content/uploads/trizeps-dips-kniend-auf-dem-dip-geraet.jpg"
      },
    ],
    "UNTERKÖRPER": [
      {
        "title": "Kniebeugen",
        "subtitle": "Beine & Po",
        "gif":
            "https://www.fitundattraktiv.de/wp-content/uploads/2017/11/sumo_kniebeuge_mit_langhantel-2.gif",
        "image": "https://training.fit/wp-content/uploads/2020/03/kniebeugen.png"
      },
      {
        "title": "Ausfallschritte mit Kurzhanteln",
        "subtitle": "Beine & Po",
        "gif":
            "https://www.marathonfitness.de/wp-content/uploads/2023/05/kurzhantel-reverse-lunges-ausfuehrung.gif",
        "image": "https://www.bodybuilding.de/wp-content/uploads/2024/09/Lunges-Ausfallschirtt-Kurzhanteln-Fitnessuebung.webp"
      },
      {
        "title": "Beinpresse",
        "subtitle": "Beine & Po",
        "gif":
            "https://www.marathonfitness.de/wp-content/uploads/2023/06/klassische-horizontale-beinpresse-ausfuehrung.gif",
        "image": "https://www.marathonfitness.de/wp-content/uploads/2023/06/klassische-horizontale-beinpresse-startposition.jpg"
      },
      {
        "title": "Wadenheben stehend",
        "subtitle": "Waden & Beine",
        "gif":
            "https://modusx.de/wp-content/uploads/wadenheben-maschine-stehend.gif",
        "image": "https://thumbs.dreamstime.com/z/trainieren-stehende-kalb-erh%C3%B6hungen-44123781.jpg"
      },
    ],
    "BAUCH + RÜCKEN": [
      {
        "title": "Unterarmstütz (Plank)",
        "subtitle": "Core & Rücken",
        "gif":
            "https://www.fitundattraktiv.de/wp-content/uploads/2021/02/plank_uebung_klassisch-1.gif",
        "image": "https://www.bodybuilding.de/wp-content/uploads/2024/09/Plank-Unterarmstuetz-Fitnessuebung.webp"
      },
      {
        "title": "Russian Twist mit Gewicht",
        "subtitle": "Bauchschrägen & Core",
        "gif":
            "https://modusx.de/wp-content/uploads/russian-twists-mit-zusatzgewicht.gif",
        "image": "https://training.fit/wp-content/uploads/2020/01/bauchtwist-sitzend-gewicht.png"
      },
      {
        "title": "Hanging Leg Raises",
        "subtitle": "Bauch & Hüfte",
        "gif":
            "https://ccuuubmtdurkmbeufybi.supabase.co/storage/v1/object/public/animations/0826.gif",
        "image": "https://www.burnthefatinnercircle.com/members/images/1789d.png?cb=20250701050339"
      },
    ],
  };

  List<Color> gradientColors = [
      Color(0xFFE0F7FA),
      Color(0xFFF1F8E9),
      Color(0xFFFFFFFF),
    ];

}
