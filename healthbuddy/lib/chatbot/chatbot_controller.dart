import 'package:flutter/material.dart';
import 'package:healthbuddy/chatbot/chatbot_screen.dart';
import 'package:healthbuddy/chatbot/chatbot_service.dart';

class ChatController extends ChangeNotifier {
  final TextEditingController text = TextEditingController();
  chatService service = chatService() ;
  final List<Message> _messages = [];
  bool options_is_opened = false ;
  int index_question = 0 ;
  int category = 0 ;

  final List options = ["Sport", "Ernährung", "Schlaf","Anderes"] ;

  final List<String> options_questions_Sport = [
  "Wie oft sollte ich pro Woche Sport treiben?",
  "Welche Sportarten sind gut für Herz und Kreislauf?",
  "Wie kann ich meine Ausdauer verbessern?",
  "Was ist besser: Krafttraining oder Ausdauertraining?",
  "Wie vermeide ich Sportverletzungen?",
  "Wie lange sollte eine Trainingseinheit dauern?",
  "Welche Übungen kann ich zu Hause machen?",
  "Wie kann ich nach einer Verletzung wieder fit werden?",
];

  // Ernährung
final List<String> options_questions_Ernahrung = [
  "Wie viele Mahlzeiten am Tag sind optimal?",
  "Welche Lebensmittel sollte ich morgens essen?",
  "Wie kann ich meinen Proteinbedarf decken?",
  "Sind Kohlenhydrate schlecht?",
  "Welche Snacks sind gesund?",
  "Wie viel Wasser sollte ich täglich trinken?",
  "Welche Lebensmittel fördern die Verdauung?",
  "Wie kann ich Gewicht gesund abnehmen?",
];

// Schlaf
final List<String> options_questions_Schlaf = [
  "Wie viele Stunden Schlaf sind ideal?",
  "Wie kann ich schneller einschlafen?",
  "Was hilft bei unruhigem Schlaf?",
  "Welche Lebensmittel beeinflussen den Schlaf?",
  "Wie kann ich meine Schlafqualität verbessern?",
  "Ist Mittagsschlaf gut oder schlecht?",
  "Wie beeinflusst Sport den Schlaf?",
  "Welche Rituale helfen beim Einschlafen?",
];

  List<Message> get messages => List.unmodifiable(_messages);

  void sendMessage() async{
    if (text.text.trim().isEmpty) return;

    _messages.insert(0, Message(text: text.text, isUser: true));
    notifyListeners();
    var response = await service.ResponseChatGpt(text.text);
    _botReply(response);
  }

  Future<void> _botReply(String userText) async {
    await Future.delayed(const Duration(milliseconds: 600));

    _messages.insert(0, Message(text: userText, isUser: false));
    notifyListeners();
  }

  void changeOptions(String topic) {
    category = options.indexOf(topic) + 1;
    if (category == 4) {
      text.text = topic;
    }else {
    if (topic == "Sport") {
     category = 1 ;
      }else if (topic == "Ernährung") {
        category = 2 ;
       }else {
          category = 3 ;
        }
       notifyListeners();
  }
  }

}