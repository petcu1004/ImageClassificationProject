import 'package:flutter/material.dart';
import 'package:flutter_application_first_toy_project/pokemonFind.dart';
import 'package:flutter_application_first_toy_project/start.dart';
import 'package:flutter_application_first_toy_project/PokemonDictionary.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  static const String _title = 'Pokemon';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //오른쪽 위 디버그 라벨 삭제
      title : _title,
      theme: ThemeData(primaryColor: Colors.redAccent),
      initialRoute: '/',
      routes:{
        '/' : (context) => Start(),
        '/first' : (context) => PokemonFind(),
        '/book':(context) => PokemonDictionary()
      },
    );
  }
}