import 'dart:html';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class PokemonFind extends StatefulWidget {
  // const PokemonFind({ Key? key }) : super(key: key);

  @override
  _PokemonFindState createState() => _PokemonFindState();
}

class _PokemonFindState extends State<PokemonFind> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('포켓몬 찾기'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        elevation: 0.0,
        toolbarHeight: 70, //AppBar 높이
      ),
      body: Center(
        child: Column(
          children: [

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushNamed('/book');
        },
        backgroundColor: Colors.redAccent,
        label: Text("포켓몬\n 도감"),
        icon: Icon(Icons.ad_units_outlined),
      ),
    );
  }

