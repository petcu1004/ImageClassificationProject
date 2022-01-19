import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

final ImagePicker _picker = ImagePicker();

//_image==null? Text('No image') : Image.file(File(_image.path)),

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late PickedFile _image;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //오른쪽 위 디버그 라벨 삭제
      title: '포켓몬',
      theme: ThemeData(primarySwatch: Colors.red), //앱의 기본적인 디자인 테마 지정
      home: Scaffold(
        appBar: AppBar(
          title: Text('포켓몬 찾기'), //AppBar 제목
          centerTitle: true, //title 가운데 정렬
          backgroundColor: Colors.redAccent, //AppBar 색상
          elevation: 0.0, //그림자
          toolbarHeight: 70, //AppBar 높이
        ),
        body: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              Text(
                '<찾고싶은 포켓몬 사진을 가져오세요>',
                //텍스트 스타일에서 폰트 사이즈 조절
                style: TextStyle(fontSize: 20, letterSpacing: 1.5),
              ),
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
