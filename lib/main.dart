import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  class MyApp extends StatelessWidget {
    const MyApp ({super.key});

    @override
    Widget build (BuildContext context) {
      return MaterialApp (
        title: 'Praktikum 3',
        theme: ThemeData (colorSchemeSeed: Colors.blue, useMaterial3: true),
        home: const InputPage(),
      );
    }
  }
}