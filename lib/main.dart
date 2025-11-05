import 'package:flutter/material.dart';

void main() {
  runApp(Calculatrice());
}

class Calculatrice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calcultatrice",
      //debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CalculatriceSimple(),
    );
  }
}

class CalculatriceSimple extends StatefulWidget {
  @override
  _CalculatriceSimpleState createState() => _CalculatriceSimpleState();
}

class _CalculatriceSimpleState extends State<CalculatriceSimple> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ma Calculatrice toute simple: Calculatrice en ligne"),
        centerTitle: true,
      ),

      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(20, 10, 10, 0),
            child: Text("0", style: TextStyle(fontSize: 35)),
          ),
        ],
      ),
    );
  }
}
