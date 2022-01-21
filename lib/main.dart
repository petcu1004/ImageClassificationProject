import 'dart:io';//이미지 피커에서 골라온 사진을 파일로 활용하기 위해서 사용

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


void main() => runApp(MyApp());




//_image==null? Text('No image') : Image.file(File(_image.path)),

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ImagePicker _picker = ImagePicker();
  late PickedFile _image;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //오른쪽 위 디버그 라벨 삭제
      title: '포켓몬',
      theme: ThemeData(primarySwatch: Colors.red), //앱의 기본적인 디자인 테마 지정
      home: Scaffold(
        appBar: AppBar(
          title: Text('포켓몬 찾기'), 
          centerTitle: true, 
          backgroundColor: Colors.redAccent, 
          elevation: 0.0, 
          toolbarHeight: 70, //AppBar 높이
        ),
        body: Padding(
          padding: EdgeInsets.all(40), //모든 화면에서 40만큼 띄움
          child: Column(
            children: [
              Text(
                '<찾고싶은 포켓몬 사진을 가져오세요>',
                //텍스트 스타일에서 폰트 사이즈 조절
                style: TextStyle(fontSize: 20, letterSpacing: 1.5),
              ),
              SizedBox(height: 40,), 
              _image==null?
              Container(
                decoration: BoxDecoration(
                border: Border.all(
                color:Colors.black,
                style:BorderStyle.solid,
                width: 2
                )
                ),
                child: Center(child: Text("<No Image>"),),
                width: 500,
                height: 450,
                
              )
              : Image.file(File(_image.path)),

              
              SizedBox(height: 40,), 

              ElevatedButton(onPressed: (){}, child: Text('찾기'),
              )
            ],
          ),
          
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _getImage,
          child: Icon(Icons.add_a_photo),
        ),
      ),
    );
  }

  Future _getImage() async {
    PickedFile image = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = image;

    });
  }
}