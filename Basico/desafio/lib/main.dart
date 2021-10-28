import 'package:desafio/widgets/mywidget.dart';
import 'package:flutter/material.dart';

void main() => runApp(AgcsApp());

class AgcsApp extends StatelessWidget {
  @override
  Widget build(BuildContext conxtext) {
    return MaterialApp(
      title: "Desafio",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
    ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Desafio Flutter Básico"),
        ),
        body: Center(
          child: AgcsWidget(),
        ),
      ),
    );
  }
}
