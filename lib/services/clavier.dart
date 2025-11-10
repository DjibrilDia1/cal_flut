import 'package:flutter/material.dart';
import 'button.dart';

Widget clavier(Function(String) onButtonClick) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      // Partie gauche : chiffres
      Expanded(
        flex: 2,
        child: GridView.count(
          crossAxisCount: 3,
          padding: const EdgeInsets.all(20),
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          children: [
            for (var text in ['7', '8', '9', '4', '5', '6', '1', '2', '3', '0', '.'])
              createButton(text, Colors.white, Colors.black87, onButtonClick),
          ],
        ),
      ),

      // Partie droite : opérateurs
      Expanded(
        flex: 1,
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.only(top: 20, right: 10),
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          children: [
            createButton('CE', Colors.blueAccent, Colors.white, onButtonClick),
            createButton('C', Colors.redAccent, Colors.white, onButtonClick),
            createButton('/', Colors.white, Colors.black, onButtonClick),
            createButton('×', Colors.white, Colors.black, onButtonClick),
            createButton('-', Colors.white, Colors.black, onButtonClick),
            createButton('+', Colors.green, Colors.white, onButtonClick),
            createButton('=', const Color.fromARGB(206, 255, 220, 114), Colors.black, onButtonClick),
          ],
        ),
      ),
    ],
  );
}
