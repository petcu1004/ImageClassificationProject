import 'package:flutter/material.dart';

class PokemonFind extends StatefulWidget {
  const PokemonFind({ Key? key }) : super(key: key);

  @override
  _PokemonFindState createState() => _PokemonFindState();
}

class _PokemonFindState extends State<PokemonFind> {
  //PickedFile f = await ImagePicker().getImage(source: ImageSource.gallery);
  //File dummyFile = File(f.path);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('포켓몬 찾기'),
      ),
      body: Container(
        child: Column(
          children: [
            //
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/found');
                },
                child: Text('찾고 싶은 포켓몬은'),
              ),
            )
          ],
        ),
      ),
    );
  }
}