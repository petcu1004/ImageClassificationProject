import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:tflite/tflite.dart';

import 'dart:io'; //이미지 피커에서 골라온 사진을 파일로 활용하기 위해서 사용

class PokemonFind extends StatefulWidget {

  @override
  _PokemonFindState createState() => _PokemonFindState();
}

class _PokemonFindState extends State<PokemonFind> {
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
            SizedBox(
              height: 20,
            ),
            Text(
              '           카메라/갤러리에서\n찾고싶은 포켓몬 사진을 가져오세요',
              style: TextStyle(fontSize: 18, letterSpacing: 1.5),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 310,
              width: 310,
              child: _image == null
                  ? Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 2,
                        ),
                      ),
                    )
                  : Image.file(File(_image!.path)),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: selectFromCamera,
                  icon: Icon(Icons.camera_alt_outlined),
                  iconSize: 50,
                ),
                IconButton(
                  onPressed: selectFromGallery,
                  icon: Icon(Icons.collections_outlined),
                  iconSize: 50,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              //실선
              height: 1.0,
              width: 350.0,
              color: Colors.black,
            ),
            SizedBox(height: 25),
            _outputs != null && _outputs?.length != 0
                ? SizedBox(
                    child: Column(
                    children: [
                      Text(
                        '< 포켓몬 정보 >',
                        style: TextStyle(fontSize: 30),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "이름 - 속성",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        _outputs![0]['label'].toString().toUpperCase(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          background: Paint()..color = Colors.white,
                        ),
                      ),
                    ],
                  ))
                : Text(
                    "데이터가 없거나 잘못된 이미지 입니다.",
                    style: TextStyle(fontSize: 20),
                  ),
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
