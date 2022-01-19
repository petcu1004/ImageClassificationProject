import 'dart:html';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PokemonFind extends StatefulWidget {
  const PokemonFind({ Key? key }) : super(key: key);

  @override
  _PokemonFindState createState() => _PokemonFindState();
}

class _PokemonFindState extends State<PokemonFind> {
  //final XFile f = await _picker.pickerImage
  //XFile f = await ImagePicker().getImage(source: ImageSource.gallery);//갤러리에서 사진을 가져옵니다.
  //File dummyFile = File(f.path);//가져온 사진의 Type을 File 형식으로 바꿔줍니다.
  //PickedFile f = await ImagePicker().getImage(source: ImageSource.camera);//갤러리에서 사진을 가져옵니다.
  //File dummyFile = File(f.path);//가져온 사진의 Type을 File 형식으로 바꿔줍니다.
  
  //final ImagePicker _picker = ImagePicker();
  //PickedFile _image;
  //_image == null ? Text("No image") : Image.file(File(_image.path));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('포켓몬 찾기'),
      ),
      body: Container(
        child: Column(
          children: [
            //Container(
            //  width: 300,
            //  height: 300,
            //  decoration: BoxDecoration(
            //    image: DecorationImage(
            //      image: FileImage(f),
            //      fit: BoxFit.cover
            //    )
            //  ),
            //),
            //FloatingActionButton(
            //  onPressed: _getImage,
            //  child: Icon(Icons.add_a_photo),
            //),
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
//  Future _getImage() async {
//    PickedFile image = await _picker.getImage(source: ImageSource.gallery);
//    setState(() {
//      _image = image;
//    });
//  }
}