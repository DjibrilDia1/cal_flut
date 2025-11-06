// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';

void main() {
  runApp(Calculatrice());
}

class Calculatrice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculatrice",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: CalculatricePage(),
    );
  }
}

class CalculatricePage extends StatefulWidget {
  @override
  CalculatricePageState createState() => CalculatricePageState();
}

class CalculatricePageState extends State<CalculatricePage> {
  String display = '';
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ma Calculatrice simple"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          zoneAffichage(),
          Expanded(child: clavier()),
        ],
      ),
    );
  }

  // Zone d’affichage des calculs et du résultat
  Widget zoneAffichage() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            display,
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            result,
            style: const TextStyle(fontSize: 28, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  // Clavier principal
  Widget clavier() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // ---- Partie gauche : chiffres ----
        Expanded(
          flex: 2,
          child: GridView.count(
            crossAxisCount: 3,
            padding:  EdgeInsets.all(12),
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            children: [
              for (var n in ['7', '8', '9', '4', '5', '6', '1', '2', '3', '0', '.'])
                createButton(n, Colors.white, Colors.black87),
            ],
          ),
        ),

        // ---- Partie droite : opérateurs ----
        Expanded(
          flex: 1,
          child: GridView.count(
            crossAxisCount: 2, 
            padding: const EdgeInsets.only(top: 13,right: 2),
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            children: [
              createButton('CE', Colors.blueAccent, Colors.white),
              createButton('C', Colors.redAccent, Colors.white),
              createButton('/', Colors.white, Colors.black),
              createButton('x', Colors.white, Colors.black),
              createButton('-', Colors.white, Colors.black),
              createButton('+', Colors.green, Colors.white),
              createButton('=', Colors.amber, Colors.black),
            ],
          ),
        ),
      ],
    );
  }

  // Bouton réutilisable
  Widget createButton(String text, Color bgColor, Color textColor) {
    return ElevatedButton(
      onPressed: () => onButtonClick(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: textColor,
        padding: const EdgeInsets.all(12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Fonction appelée quand on clique sur un bouton
  void onButtonClick(String text) {
    setState(() {
      // Exemple basique de comportement (à améliorer plus tard)
      if (text == 'C') {
        display = '';
        result = '';
      } else if (text == '=') {
        // Plus tard : ajouter la logique de calcul ici
        result = display; 
      } else {
        display += text;
      }
    });
  }
}
