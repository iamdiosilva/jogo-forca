import 'dart:math';
import 'package:forca/views/lose.dart';
import 'package:forca/views/win.dart';
import 'package:restart_app/restart_app.dart';

import 'package:flutter/material.dart';
import 'package:forca/repository/word_repository.dart';
import 'package:forca/ui/colors.dart';
import 'package:forca/ui/widget/figure_image.dart';
import 'package:forca/ui/widget/lettter.dart';
import 'package:forca/utils/game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeApp(),
      },
    );
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

_lose(BuildContext context) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Lose()));
}

class _HomeAppState extends State<HomeApp> {
  String word = WordRepository.wordList[4].word!.toUpperCase();
  String tip = WordRepository.wordList[4].tip!.toUpperCase();
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
            children: word.split('').map((e) => letter(e.toUpperCase(), !Game.selectChar.contains(e.toUpperCase()))).toList(),
          ),
          SizedBox(
            height: 12,
          ),
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
                  onPressed: Game.selectChar.contains(e)
                      ? null
                      : () {
                          setState(() {
                            Game.selectChar.add(e);
                            print(Game.selectChar);
                            if (!word.split('').contains(e.toUpperCase())) {
                              Game.tries++;
                              if (Game.tries == 6) {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Lose()));
                              }
                            } else {
                              //implementar win
                            }
                          });
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
