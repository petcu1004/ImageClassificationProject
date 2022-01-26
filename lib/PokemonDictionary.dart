import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PokemonDictionary extends StatefulWidget {
  const PokemonDictionary({Key? key}) : super(key: key);

  @override
  _PokemonDictionaryState createState() => _PokemonDictionaryState();
}

class _PokemonDictionaryState extends State<PokemonDictionary> {
  TextEditingController _filter = TextEditingController(); //
  FocusNode focusNode = FocusNode(); //
  String _searchText = ""; //
  final _formKey = GlobalKey<FormState>(); //
  final ScrollController _scrollController = ScrollController();

  final List<String> pokemonimage = <String>[
    'Abra',
    'Aerodactyl',
    'Alakazam',
    'Alolan Sandslash',
    'Arbok',
    'Arcanine',
    'Articuno',
    'Beedrill',
    'Bellsprout',
    'Blastoise',
    'Bulbasaur',
    'Butterfree',
    'Caterpie',
    'Chansey',
    'Charizard',
    'Charmander',
    'Charmeleon',
    'Clefable',
    'Clefairy',
    'Cloyster',
    'Cubone',
    'Dewgong',
    'Diglett',
    'Ditto',
    'Dodrio',
    'Doduo',
    'Dragonair',
    'Dragonite',
    'Dratini',
    'Drowzee',
    'Dugtrio',
    'Eevee',
    'Ekans',
    'Electabuzz',
    'Electrode',
    'Exeggcute',
    'Exeggutor',
    'Farfetchd',
    'Fearow',
    'Flareon',
    'Gastly',
    'Gengar',
    'Geodude',
    'Gloom',
    'Golbat',
    'Goldeen',
    'Golduck',
    'Golem',
    'Graveler',
    'Grimer',
    'Growlithe',
    'Gyarados',
    'Haunter',
    'Hitmonchan',
    'Hitmonlee',
    'Horsea',
    'Hypno',
    'Ivysaur',
    'Jigglypuff',
    'Jolteon'
  ];

  _SearchSreenState() {
    _filter.addListener(() {
      setState(() {
        _searchText = _filter.text;
      });
    });
  }

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
      body: Scrollbar(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Row(
              
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 50,
                  width: 360,
                  child: TextField(
                    
                focusNode: focusNode,
                style: TextStyle(
                  fontSize: 20,
                ),
                autofocus: false, //바로 입력창이 뜨게 돼서 불편
                controller: _filter,
                decoration: InputDecoration(
                  hintText: 'Pokemon Name', //힌트와 글씨색이 안보임.
                  labelStyle: TextStyle(color: Colors.black),
                  filled: true,
                  fillColor: Colors.grey[300],
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.redAccent,
                    size: 25,
                  ),
                    suffixIcon: focusNode.hasFocus
                      ? null
                      : IconButton(
                          icon: Icon(
                            Icons.cancel_outlined,
                            color: Colors.redAccent,
                            size: 25,
                          ),
                          onPressed: () {
                            setState(() {
                              _filter.clear();
                              _searchText = "";
                            });
                          },
                        ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                )
              ),
                IconButton(
                icon: Icon(
                  Icons.send,
                  color: Colors.redAccent,
                  size: 30,
                ),
                onPressed: () {
                  int check = 0;
                  for (int i = 0; i < pokemonimage.length; i++) {
                    if (_filter.text == pokemonimage[i]) {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset('images/${pokemonimage[i]}.jpg'),
                                  Text(
                                    '이름: ' + pokemonimage[i],
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
                                  child: new TextButton(
                                    child: new Text("닫기"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                )
                              ],
                            );
                          });
                      check = 1;
                    }
                  }
                  if (check == 0) {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "포켓몬 도감에 없는 포켓몬입니다.",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            ),
                            actions: <Widget>[
                              Center(
                                child: new TextButton(
                                  child: new Text("닫기"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              )
                            ],
                          );
                        });
                  }
                }), //
              ],
            ),
            SizedBox(height: 15,),
            

            Expanded(
              child: GridView.builder(
                // padding: const EdgeInsets.all(20),
                padding: const EdgeInsets.only(
                    top: 0, left: 20, right: 20, bottom: 20),

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 4.0,
                    childAspectRatio: 1 / 1),
                itemCount: pokemonimage.length,
                itemBuilder: (ctx, index) {
                  return Container(
                    color: Colors.white,
                    child: InkWell(
                      child: Image.asset('images/${pokemonimage[index]}.jpg',
                          width: 120, height: 120),
                      onTap: () {
                        showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                        'images/${pokemonimage[index]}.jpg'),
                                    Text(
                                      //_output![0]['label'].toString().toUpperCase(),
                                      '이름: ${pokemonimage[index]}',
                                      // 속성?
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ],
                                ),
                                actions: <Widget>[
                                  Center(
                                    child: new TextButton(
                                      child: new Text("닫기"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  )
                                ],
                              );
                            });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
