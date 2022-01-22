import 'package:flutter/material.dart';

class PokemonFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('포켓몬 찾기 성공'),
        backgroundColor: Colors.redAccent, 
        centerTitle: true, 
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/notfound');
            },
            child: Text('포켓몬 찾기 성공!'),
          ),
        ),
      ),
    );
  }
}