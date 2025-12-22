import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datenschutzerklärung'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            '''
Datenschutzerklärung

Letzte Aktualisierung: 18.12.2025

Diese Datenschutzerklärung erklärt, wie [Name der App] Informationen der Nutzer erhebt, verwendet und schützt.

1. Erhobene Daten
Unsere App kann folgende Informationen erfassen:
- Personenbezogene Daten (z. B. Name, E-Mail-Adresse), nur wenn diese freiwillig angegeben werden
- Technische Daten (z. B. Gerätetyp, Betriebssystemversion)
- Nutzungsdaten zur Verbesserung der App

2. Verwendung der Daten
Die Daten werden verwendet, um:
- die App bereitzustellen und zu verbessern
- Fehler zu beheben
- die Nutzererfahrung zu optimieren

3. Weitergabe von Daten
Wir verkaufen oder vermieten keine personenbezogenen Daten.
Eine Weitergabe erfolgt nur bei gesetzlicher Verpflichtung oder für notwendige Drittanbieter (z. B. Firebase).

4. Datensicherheit
Wir treffen angemessene Sicherheitsmaßnahmen zum Schutz der Daten.

5. Dienste von Drittanbietern
Die App kann Dienste von Drittanbietern nutzen, die eigene Datenschutzerklärungen haben.

6. Datenschutz von Kindern
Es werden nicht wissentlich personenbezogene Daten von Kindern erhoben.

7. Änderungen
Diese Datenschutzerklärung kann jederzeit aktualisiert werden.

8. Kontakt
E-Mail: moutiaabedlahfidh@gmail.com
            ''',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
