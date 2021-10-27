import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercício 9',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Exercício 9'),
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
  final textoController = TextEditingController();
  String _texto = '';

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 280,
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: textoController,
                decoration: const InputDecoration(hintText: 'Enter a text'),
              ),
            ),
            ElevatedButton(
                child: const Text('Show Text'),
                onPressed: () {
                  setState(() {
                    _texto = textoController.text;
                  });
                }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_texto),
            )
          ],
        ),
      ),
    );
  }
}
