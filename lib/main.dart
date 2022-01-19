import 'dart:html';
import 'package:flutter/material.dart';

import 'package:flutter_application_first_toy_project/pokemonFind.dart';
import 'package:flutter_application_first_toy_project/pokemonFound.dart';
import 'package:flutter_application_first_toy_project/pokemonNotFound.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  static const String _title = 'Widget Example';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      initialRoute: '/',
      routes: {
        '/': (context) => PokemonFind(),
        '/found': (context) => PokemonFound(),
        '/notfound': (context) => PokemonNotFound(),
      },
    );
  }
}