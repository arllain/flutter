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
        body: Column(
          children: <Widget>[
            Flexible(flex: 1,
                child: ElevatedButton(
                  child: const Text('Resetar todos os itens', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold )),
                  onPressed: () {},
                ),
            ),
            const Flexible(flex: 6,
                child: AgcsWidget(),
            )
          ],

        ),
      ),
    );
  }
}
