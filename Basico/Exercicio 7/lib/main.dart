import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Exercício 7'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child:  Wrap(
            direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              spacing: 10.0,
              children: const <Widget> [
                    Text('Texto 1',
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, backgroundColor: Colors.blue)),
                    Padding(padding: EdgeInsets.all(40.0)),
                    Text('Texto 2',
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, backgroundColor: Colors.blue)),
                    Text('Texto 3',
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, backgroundColor: Colors.blue)),
                    Padding(padding: EdgeInsets.all(40.0)),
                    Text('Texto 4',
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, backgroundColor: Colors.blue))
              ]
          ),
        )
    );
  }
}
