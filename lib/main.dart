import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'services/display.dart';
import 'services/clavier.dart';

void main() {
  runApp(Calculatrice());
}

class Calculatrice extends StatelessWidget {
  const Calculatrice({super.key});

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
  const CalculatricePage({super.key});

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
          zoneAffichage(display, result),
          Expanded(child: clavier(onButtonClick)),
        ],
      ),
    );
  }

  // Gestion des clics clavier
  void onButtonClick(String text) {
    setState(() {
      if (text == 'C') {
        display = '';
        result = '';
      } else if (text == 'CE') {
        if (display.isNotEmpty) {
          display = display.substring(0, display.length - 1);
        }
      } else if (text == '=') {
        try {
          final expr = display.replaceAll('×', '*').replaceAll('÷', '/');
          // ignore: deprecated_member_use
          Parser p = Parser();
          Expression exp = p.parse(expr);
          ContextModel cm = ContextModel();
          final val = exp.evaluate(EvaluationType.REAL, cm);
          result = val.toString();
        } catch (_) {
          result = 'Erreur';
        }
      } else {
        display += text;
      }
    });
  }
}
