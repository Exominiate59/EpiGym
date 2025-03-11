import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon App',
      home: Scaffold(
        appBar: AppBar(title: Text('Bienvenue')),
        body: Center(child: Text('Hello Flutter!')),
      ),
    );
  }
}
