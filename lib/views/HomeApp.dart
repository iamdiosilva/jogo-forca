import 'package:flutter/material.dart';
import 'package:forca/views/win.dart';

import '../repository/word_repository.dart';
import '../ui/colors.dart';
import '../ui/widget/figure_image.dart';
import '../ui/widget/lettter.dart';
import '../utils/game.dart';
import 'lose.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool visible() {
    return Game.letterList.every((element) => element.hidden == false);
  }

  String word = WordRepository.wordList[3].word!.toUpperCase();
  String tip = WordRepository.wordList[3].tip!.toUpperCase();
  bool correct = false;
  List<String> alph = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        title: Text("Hangman"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColor.primaryColorDark,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              children: [
                figureImage(Game.tries >= 0, "forc.png"),
                figureImage(Game.tries >= 1, "head.png"),
                figureImage(Game.tries >= 2, "body.png"),
                figureImage(Game.tries >= 3, "ra.png"),
                figureImage(Game.tries >= 4, "la.png"),
                figureImage(Game.tries >= 5, "rl.png"),
                figureImage(Game.tries >= 6, "ll.png")
              ],
            ),
          ),
          Container(
            height: 60,
            width: 250,
            decoration: BoxDecoration(
              color: Color(0xff7B70B1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: (Game.tries >= 5)
                  ? Text(
                      tip,
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    )
                  : Text(
                      '?????',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: Game.letterList =
                word.split('').map((e) => Letter(character: e.toUpperCase(), hidden: !Game.selectChar.contains(e.toUpperCase()))).toList(),
          ),
          SizedBox(
            height: 12,
          ),
          (visible())
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AppColor.primaryColorDark,
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Win()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Continue.', style: TextStyle(fontSize: 25, color: Colors.white)),
                    ),
                  ),
                )
              : SizedBox(),
          SizedBox(
            width: double.infinity,
            height: 250.0,
            child: GridView.count(
              crossAxisCount: 10,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              padding: EdgeInsets.all(8.0),
              children: alph.map((e) {
                return RawMaterialButton(
                  onPressed: () {
                    if (!Game.selectChar.contains(e)) {
                      setState(() {
                        Game.selectChar.add(e);
                        print(Game.selectChar);

                        if (visible()) {
                          Game.selectChar = [];
                          Game.tries = 0;
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Win()));
                        }

                        if (!word.split('').contains(e.toUpperCase())) {
                          Game.tries++;
                          if (Game.tries == 6) {
                            Game.selectChar = [];
                            Game.tries = 0;
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Lose()));
                          }
                        }
                      });
                    }
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    e,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  fillColor: Game.selectChar.contains(e) ? Colors.black87 : Colors.blue,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
