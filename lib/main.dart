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
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ---- Partie gauche : chiffres ----
          Expanded(
            flex: 2,
            child: Column(
              children: [
                // Grille 3x3 pour 7-9, 4-6, 1-3
                Row(
                  children: [
                    for (int i = 0; i < 3; i++)
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: i < 2 ? 4 : 0,
                            bottom: 8,
                          ),
                          child: createSquareButton(
                            ['7', '8', '9'][i],
                            Colors.white,
                            Colors.black87,
                          ),
                        ),
                      ),
                  ],
                ),
                Row(
                  children: [
                    for (int i = 0; i < 3; i++)
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: i < 2 ? 4 : 0,
                            bottom: 8,
                          ),
                          child: createSquareButton(
                            ['4', '5', '6'][i],
                            Colors.white,
                            Colors.black87,
                          ),
                        ),
                      ),
                  ],
                ),
                Row(
                  children: [
                    for (int i = 0; i < 3; i++)
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: i < 2 ? 4 : 0,
                            bottom: 8,
                          ),
                          child: createSquareButton(
                            ['1', '2', '3'][i],
                            Colors.white,
                            Colors.black87,
                          ),
                        ),
                      ),
                  ],
                ),
                // Ligne du bas : 0 (large) et .
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 4, bottom: 8),
                        child: createWideButton(
                          '0',
                          Colors.white,
                          Colors.black87,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4, bottom: 8),
                        child: createSquareButton(
                          '.',
                          Colors.white,
                          Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
                // Bouton Sépar. mill.
                Row(
                  children: [
                    Expanded(
                      child: createSquareButton(
                        'Sépar. mill.',
                        Colors.white,
                        Colors.black87,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Container(), // Espace vide
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Container(), // Espace vide
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // ---- Partie droite : opérateurs ----
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: 2),
              child: Column(
                children: [
                  // Première ligne : CE et C
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 4, bottom: 8),
                          child: createSquareButton(
                            'CE',
                            Colors.blueAccent,
                            Colors.white,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4, bottom: 8),
                          child: createSquareButton(
                            'C',
                            Colors.redAccent,
                            Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Deuxième ligne : / et ×
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 4, bottom: 8),
                          child: createSquareButton(
                            '/',
                            Colors.white,
                            Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4, bottom: 8),
                          child: createSquareButton(
                            '×',
                            Colors.white,
                            Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Troisième ligne : - et + (grand) avec = en dessous
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Colonne avec - et =
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: createSquareButton(
                                    '-',
                                    Colors.white,
                                    Colors.black,
                                  ),
                                ),
                                createSquareButton(
                                  '=',
                                  Colors.amber,
                                  Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Bouton + qui s'étend sur toute la hauteur de - et =
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: ElevatedButton(
                              onPressed: () => onButtonClick('+'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 1,
                              ),
                              child: const Text(
                                '+',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Bouton carré de taille fixe
  Widget createSquareButton(String text, Color bgColor, Color textColor) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: ElevatedButton(
        onPressed: () => onButtonClick(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: textColor,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 1,
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  // Bouton large (pour le 0) - même hauteur qu'un carré
  Widget createWideButton(String text, Color bgColor, Color textColor) {
    return AspectRatio(
      aspectRatio: 2.0, // Largeur = 2x la hauteur
      child: ElevatedButton(
        onPressed: () => onButtonClick(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: textColor,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 1,
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  // Bouton haut (pour le +) - même largeur qu'un carré, 2x la hauteur
  Widget createTallButton(String text, Color bgColor, Color textColor) {
    return AspectRatio(
      aspectRatio: 0.5, // Hauteur = 2x la largeur
      child: ElevatedButton(
        onPressed: () => onButtonClick(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: textColor,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 1,
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  // Bouton réutilisable (pour compatibilité)
  Widget createButton(String text, Color bgColor, Color textColor) {
    return ElevatedButton(
      onPressed: () => onButtonClick(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: textColor,
        padding: const EdgeInsets.all(12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
        // logique d'operation !
        result = display;
      } else {
        display += text;
      }
    });
  }
}
