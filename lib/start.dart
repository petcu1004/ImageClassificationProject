import 'package:flutter/material.dart';

class Start extends StatefulWidget {

  static const String _title = 'Pokemon';

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('포켓몬'), 
          centerTitle: true, 
          backgroundColor: Colors.redAccent, 
          elevation: 0.0, 
          toolbarHeight: 70, //AppBar 높이
        ),
        body: Padding(
          padding: EdgeInsets.all(40), //모든 화면에서 40만큼 띄움
          child: Column(
            children: [
              Container(
                child:Center(
                  child: Image(image: AssetImage('images/title.png')),
              ),),
              Container(
                child:Center(
                  child: Image(image: AssetImage('images/main.jfif')),
              ),),
              SizedBox(height: 60,), 

              ElevatedButton(onPressed: (){
                Navigator.of(context).pushNamed('/first');
              }, child: Text('시작하기',),
                style: TextButton.styleFrom(textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                minimumSize: Size(200.0, 70.0),
                backgroundColor: Colors.redAccent),
              ),
            ],
          ),
          
        ),
      );

  }
}