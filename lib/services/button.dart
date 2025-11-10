import 'package:flutter/material.dart';

Widget createButton(
  String text,
  Color bgColor,
  Color textColor,
  Function(String) onButtonClick,
) {
  return SizedBox(
    width: 70, // Taille uniforme
    height: 70, // Même taille pour tous
    child: ElevatedButton(
      onPressed: () => onButtonClick(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: textColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(
          0,
        ), // évite que le padding interne change la taille
        textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      child: Text(text),
    ),
  );
}
