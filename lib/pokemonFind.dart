import 'dart:html';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class PokemonFind extends StatefulWidget {

  @override
  _PokemonFindState createState() => _PokemonFindState();
}

class _PokemonFindState extends State<PokemonFind> {
<<<<<<< HEAD
  File? _image;

  List? _outputs;

  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  //모델과 label.txt를 가져온다.
  loadModel() async {
    await Tflite.loadModel(
      model: "assets/gdsc_pokemon_CNN.tflite",
      labels: "assets/label.txt",
    ).then((value) {
      setState(() {
      });
    });
  }

  //이미지 분류
  Future classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        imageMean: 0.0,
        imageStd: 255.0,
        numResults: 150,
        threshold: 0.2,
        asynch: true);
    setState(() {
      _outputs = output;
    });
  }
=======
>>>>>>> a93d5503c7cb7e2cb8dd3ad04052576bcf8fadca

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

<<<<<<< HEAD
  selectFromGallery() async {
    XFile? ximage = await ImagePicker().pickImage(source: ImageSource.gallery);
    File image = File(ximage!.path);
    if (image == null) return;
    setState(() {
      _image = image;
    });
    await classifyImage(File(image.path)); //가져온 이미지를 분류하기 위해 await을 사용
    //await을 사용하지 않으면 새로 가져온 이미지를 분류하지 않고 이전에 있었던 이미지를 가지고 분류하는 경우가 생기게 된다.
  }

  selectFromCamera() async {
    XFile? ximage = await ImagePicker().pickImage(source: ImageSource.camera);
    File image = File(ximage!.path);
    if (image == null) return;
    setState(() {
      _image = image;
    });
    await classifyImage(File(image.path)); //가져온 이미지를 분류하기 위해 await을 사용
  }

  // 앱이 종료될 때
  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}
=======
>>>>>>> a93d5503c7cb7e2cb8dd3ad04052576bcf8fadca
