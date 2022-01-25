import 'package:flutter/material.dart';
import 'dart:io';
import 'package:tflite/tflite.dart';

class PokemonFound extends StatefulWidget {
  @override
  State<PokemonFound> createState() => _PokemonFoundState();
}

class _PokemonFoundState extends State<PokemonFound> {

  List? _outputs;
  

  void initState(){
    super.initState();
    // recycleDialog();
    loadModel().then((value) {
      setState(() {});
    });
    // await classifyImage(File());
  }



 //모델과 label.txt를 가져온다.
  loadModel() async{
    await Tflite.loadModel(
      model: "assets/gdsc_pokemon_CNN.tflite",
      labels: "assets/label.txt",)
    .then((value){
      setState(() {
        //_loading=false;
      });
    });
  }

  //이미지 분류
  Future classifyImage(File args) async{
    // print("TEST$args");
    var output = await Tflite.runModelOnImage(
      path: args.path,
      imageMean: 0.0,
      imageStd: 256.0,
      numResults: 150,
      threshold: 0.2,
      asynch: true);
    setState(() {
      _outputs=output;
    });
  }

//안내 메시지 보이기
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
    final String args = ModalRoute.of(context)!.settings.arguments as String;

    classifyImage(File(args));
    recycleDialog();

    return Scaffold(
      appBar: AppBar(
        title: Text('포켓몬 찾기 성공'),
        backgroundColor: Colors.redAccent, 
        centerTitle: true, 
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child:Column(children: [

        Center(
          child: Container(
            child: args == null?
            Container(
                decoration: BoxDecoration(
                border: Border.all(
                color:Colors.black,
                style:BorderStyle.solid,
                width: 2,
                ),
                
                ),

                // width: 300,
                // height: 300,
              )
            :Image.file(File(args)),
            
          ),
          
          
        ),
        SizedBox(height: 20,),
        

        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/notfound');
            },child: Text("test"),),

        ],)
        
        
        
      ),
      

          
        );
  }






}
