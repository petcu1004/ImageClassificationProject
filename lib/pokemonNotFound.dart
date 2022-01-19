import 'package:flutter/material.dart';

class PokemonNotFound extends StatelessWidget {
  const PokemonNotFound({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('포켓몬 찾기 실패'),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('포켓몬 찾기 실패!'),
          ),
        ),
      ),
    );
  }
}