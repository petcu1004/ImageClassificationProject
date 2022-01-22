import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';//이미지 피커에서 골라온 사진을 파일로 활용하기 위해서 사용

class PokemonFind extends StatefulWidget {
  // const PokemonFind({ Key? key }) : super(key: key);

  @override
  _PokemonFindState createState() => _PokemonFindState();
}

class _PokemonFindState extends State<PokemonFind> {
  // final ImagePicker _picker = ImagePicker();
  // late PickedFile _image;

  File _image=File("images/what.png");

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
        body: Padding(
          padding: EdgeInsets.all(40), //모든 화면에서 40만큼 띄움
          child: Column(
            children: [
              Text(
                '<찾고싶은 포켓몬 사진을 가져오세요>',
                style: TextStyle(fontSize: 20, letterSpacing: 1.5),
              ),
              SizedBox(height: 40,), 

              _image==null
              ? Container(
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
              // :Image.file(_image, fit:BoxFit.fill),

              
              SizedBox(height: 40,), 

              ElevatedButton(onPressed: (){
                Navigator.of(context).pushNamed('/second');
              }, child: Text('찾기'),
              style: TextButton.styleFrom(backgroundColor: Colors.redAccent),
              )
            ],
          ),
          
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: selectFromGallery,
          child: Icon(Icons.add_a_photo),
        ),
      
    );
  }

  // Future _getImage() async {
  //   PickedFile image = await _picker.getImage(source: ImageSource.gallery);
  //   setState(() {
  //     _image = image;

  //   });
  // }

  selectFromGallery() async{
    XFile? ximage=await ImagePicker().pickImage(source: ImageSource.gallery);
    File image = File(ximage!.path);
    if(image ==null) return;
    setState(() {
      // sendImage(image);
      _image=image;
    });
  }

  // _imageFromGallery() async {
  //   XFile? image = await ImagePicker()
  //       .pickImage(source: ImageSource.gallery, imageQuality: 50);
  //   setState(() {
  //     _image = image;
  //   });
  // }



}