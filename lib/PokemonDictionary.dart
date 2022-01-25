import 'package:flutter/material.dart';

class PokemonDictionary extends StatefulWidget {
  const PokemonDictionary({Key? key}) : super(key: key);

  @override
  _PokemonDictionaryState createState() => _PokemonDictionaryState();
}

class _PokemonDictionaryState extends State<PokemonDictionary> {
  TextEditingController editingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<String> pokemonimage = <String>[
    'Abra.jpg',
    'Aerodactyl.jpg',
    'Alakazam.jpg',
    'Alolan Sandslash.jpg',
    'Arbok.jpg',
    'Arcanine.jpg',
    'Articuno.jpg',
    'Beedrill.jpg'
  ];
  List<String> s = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
    '32',
    '33',
    '34',
    '35',
    '36',
    '37',
    '38',
    '39',
    '40',
    '41',
    '42',
    '43',
    '44',
    '45',
    '46',
    '47',
    '48',
    '49',
    '50',
    '51',
    '52',
    '53',
    '54',
    '55',
    '56',
    '57',
    '58',
    '59',
    '60',
    '61',
    '62',
    '63',
    '64',
    '65',
    '66',
    '67',
    '68',
    '69',
    '70',
    '71',
    '72',
    '73',
    '74',
    '75',
    '76',
    '77',
    '78',
    '79',
    '80',
    '81',
    '82',
    '83',
    '84',
    '85',
    '86',
    '87',
    '88',
    '89',
    '90',
    '91',
    '92',
    '93',
    '94',
    '95',
    '96',
    '97',
    '98',
    '99',
    '100',
    '101',
    '102',
    '103',
    '104',
    '105',
    '106',
    '107',
    '108',
    '109',
    '110',
    '111',
    '112',
    '113',
    '114',
    '115',
    '116',
    '117',
    '118',
    '119',
    '120',
    '121',
    '122',
    '123',
    '124',
    '125',
    '126',
    '127',
    '128',
    '129',
    '130',
    '131',
    '132',
    '133',
    '134',
    '135',
    '136',
    '137',
    '138',
    '139',
    '140',
    '141',
    '142',
    '143',
    '144',
    '145',
    '146',
    '147',
    '148',
    '149',
    '150'
  ];
  List<String> b = [
    'Abra',
    'Aerodactyl',
    'Alakazam',
    'Alolan Sandslash',
    'Arbok',
    'Arcanine',
    'Articuno',
    'Beedrill',
    'Bellsprout',
    'Blastoise'
  ];
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
//

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
        //controller: _scrollController, //
        //isAlwaysShown: true, //
        ////thickness: 15,
        ////body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                onChanged: (value) {},
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
                padding: const EdgeInsets.only(
                    top: 0, left: 20, right: 20, bottom: 20),

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 4.0,
                    childAspectRatio: 1 / 1),
                itemCount: s.length,
                itemBuilder: (ctx, index) {
                  return Container(
                    color: Colors.green[100],
                    child: Center(
                      //  child: Text('${s[index]} = ${pokemonimage[index]}'),
                      child: Image.asset('images/${pokemonimage[index]}'),
                      //child: Image.asset('images/${pokemonimage[index]}', fit: BoxFit.cover),
                      //child: Image(image: AssetImage('images/${pokemonimage[index]}')),
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
