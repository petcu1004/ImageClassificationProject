import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:tflite/tflite.dart';

import 'dart:io'; //이미지 피커에서 골라온 사진을 파일로 활용하기 위해서 사용

class PokemonFind extends StatefulWidget {
  // const PokemonFind({ Key? key }) : super(key: key);

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
        //_loading=false;
      });
    });
  }

  //이미지 분류
  Future classifyImage(File image) async {
    // print("TEST$image");
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

  show() {
    if(_outputs != null && _outputs!.length !=0)
        {SizedBox(
            child: Column(
            children: [
              Text(
                '< 포켓몬 정보 >',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 10),
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
          ));}
        else{
          Text(
            "데이터가 없거나 잘못된 이미지 입니다.",
            style: TextStyle(fontSize: 20),
          );
        }
  }

  recycleDialog() {
    _outputs != null
        ? showDialog(
            context: context,
            barrierDismissible:
                false, // barrierDismissible - Dialog를 제외한 다른 화면 터치 x
            builder: (BuildContext context) {
              return AlertDialog(
                // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "이름  -  속성\n" +
                          _outputs![0]['label'].toString().toUpperCase(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        background: Paint()..color = Colors.white,
                      ),
                    ),
                  ],
                ),
                actions: <Widget>[
                  Center(
                    child: new FlatButton(
                      child: new Text("Ok"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              );
            })
        : showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "데이터가 없거나 잘못된 이미지 입니다.",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
                actions: <Widget>[
                  Center(
                    child: new FlatButton(
                      child: new Text("Ok"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              );
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
        // padding: EdgeInsets.fromLTRB(40, 20, 40, 20), //모든 화면에서 40만큼 띄움
        child: Column(
          children: [
            // Padding(padding: EdgeInsets.fromLTRB(20, 20, 20, 20)), //모든 화면에서 40만큼 띄움
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
              child: 
              
              _image == null 
              // && _image?.length() ==0
                  ? Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 2,
                        ),
                      ),
                      // child: Center(child: TextButton(onPressed: selectFromGallery,
                      // child: Text("포켓몬 사진을 가져오고 싶으면 이 문구를 입력하세요"),
                      // style: TextButton.styleFrom(primary: Colors.black,),),

                      //   child: Center(child: IconButton(onPressed: selectFromGallery,
                      //   icon: Icon(Icons.collections_outlined),
                      //   iconSize: 80,
                      //   ),
                      // ),
                      // width: 500,
                      // height: 470,
                    )
                  : Image.file(File(_image!.path)),
            ),

            SizedBox(
              height: 10,
            ),

            // IconButton(
            //         onPressed: selectFromCamera,

              Row(
                mainAxisAlignment : MainAxisAlignment.center,

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

            // ElevatedButton(
            //     onPressed: () {
            //       show();
            //       // recycleDialog();
            //       // Navigator.of(context)
            //       //     .pushNamed('/second', arguments: _image?.path);
            //     },
            //     child: Text('찾기'),
            //     style: TextButton.styleFrom(
            //       textStyle: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         fontSize: 20,
            //       ),
            //       backgroundColor: Colors.redAccent,
            //       minimumSize: Size(200.0, 40.0),
            //     )),
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

            //   // Padding(padding: EdgeInsets.fromLTRB(40, 40, 0, 0),
            // child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            // children: [
            // Text(
            //           "이름  -  속성\n"+_outputs![0]['label'].toString().toUpperCase(),
            //           style: TextStyle(
            //             color: Colors.black,
            //             fontSize: 15.0,
            //             background: Paint()..color = Colors.white,
            //           ),
            //         ),
            // // Text('속성 : ')
            // ],),
            // ),
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
    // recycleDialog();
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
    // Tflite.close();
    super.dispose();
  }
}
