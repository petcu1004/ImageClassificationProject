import 'package:flutter/material.dart';

class Book extends StatefulWidget {
  const Book({Key? key}) : super(key: key);

  @override
  _BookState createState() => _BookState();
}

class _BookState extends State<Book> {
  TextEditingController editingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();  
  List<String> s = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'];
//   final bearItem = {
//   "list": [
//     {"image": "assets/images/img_blue.png", "name": "파랑이"},
//     {"image": "assets/images/img_mint.png", "name": "민트트"},
//     {"image": "assets/images/img_skyblue.png", "name": "하늘이"},
//     {"image": "assets/images/img_white.png", "name": "하양이"},
//     {"image": "assets/images/img_pink.png", "name": "분홍이"},
//     {"image": "assets/images/img_yellow.png", "name": "노랑이"},
//     {"image": "assets/images/img_purple.png", "name": "보라라"},
//     {"image": "assets/images/img_mix.png", "name": "믹스스"}
//   ]
// };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('포켓몬 도감'),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
          elevation: 0.0,
          toolbarHeight: 70, //AppBar 높이
        ),
        body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                onChanged: (value) {
                  
                },
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            // Scrollbar(controller: _scrollController, isAlwaysShown: true,thickness: ,child:
            Expanded(
              child: GridView.builder(
                // padding: const EdgeInsets.all(20),
                padding:const EdgeInsets.only(top:0, left: 20, right: 20, bottom: 20),
                
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                childAspectRatio: 2 / 3),
            itemCount: s.length,
            itemBuilder: (ctx, index) {
              return Container(
                color: Colors.green[100],
                child: Center(
                  child: Text('${s[index]}'),
                ),
              );
            },
          ),
            ),
            
          ],
        ),
      ),
        // Padding(
        //   padding: EdgeInsets.all(40),

        //   child: GridView.builder(
        //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //         crossAxisCount: 3,
        //         mainAxisSpacing: 4.0,
        //         crossAxisSpacing: 4.0,
        //         childAspectRatio: 2 / 3),
        //     itemCount: s.length,
        //     itemBuilder: (ctx, index) {
        //       return Container(
        //         color: Colors.green[100],
        //         child: Center(
        //           child: Text('${s[index]}'),
        //         ),
        //       );
        //     },
        //   ),
          
        // )
        );
  }
}
