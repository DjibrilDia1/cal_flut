import 'package:flutter/material.dart';

Widget zoneAffichage(String display, String result) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(20),
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Affichage 
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            display,
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        // Resultat
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            result,
            style: const TextStyle(fontSize: 28, color: Colors.black54),
          ),
        ),
      ],
    ),
  );
}
