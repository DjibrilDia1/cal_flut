import 'package:flutter/material.dart';
import 'button.dart';

Widget clavier(Function(String) onButtonClick) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      // Partie gauche : chiffres
      SizedBox(
        width: 260, // largeur fixe pour les chiffres
        child: Column(
          children: [
            // Grille chiffres
            SizedBox(
              height: 320, // hauteur fixe
              child: GridView.count(
                crossAxisCount: 3,
                padding: const EdgeInsets.all(18),
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1.0,
                children: [
                  for (var text in [
                    '7', '8', '9', '4', '5', '6', '1', '2', '3', '0', '.'
                  ])
                    createButton(text, Colors.white, Colors.black87, onButtonClick),
                ],
              ),
            ),
            // Bouton Sépar. mill.
            SizedBox(
              height: 90,
              child: GridView.count(
                crossAxisCount: 1,
                padding: const EdgeInsets.all(16),
                childAspectRatio: 8 / 2,
                children: [
                  createButton("Sépar. mill.", Colors.white, Colors.black, onButtonClick),
                ],
              ),
            ),
          ],
        ),
      ),
      // Partie droite : opérateurs
      SizedBox(
        width: 150, // largeur fixe pour les opérateurs
        height: 440, // hauteur fixe pour correspondre à la gauche
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.only(top: 20, right: 15),
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1.0,
          children: [
            createButton('CE', Colors.blueAccent, Colors.white, onButtonClick),
            createButton('C', Colors.redAccent, Colors.white, onButtonClick),
            createButton('/', Colors.white, Colors.black, onButtonClick),
            createButton('×', Colors.white, Colors.black, onButtonClick),
            createButton('-', Colors.white, Colors.black, onButtonClick),
            createButton('+', Colors.green, Colors.white, onButtonClick),
            createButton(
              '=',
              const Color.fromARGB(206, 255, 220, 114),
              Colors.black,
              onButtonClick,
            ),
          ],
        ),
      ),
    ],
  );
}
