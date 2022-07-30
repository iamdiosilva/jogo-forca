import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:forca/main.dart';
import 'package:forca/ui/colors.dart';
import 'package:forca/utils/game.dart';

import 'HomeApp.dart';

class Win extends StatelessWidget {
  const Win({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: AppColor.primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Você Acertou!',
              style: TextStyle(fontSize: 50, color: Colors.white),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColor.primaryColorDark,
              ),
              child: TextButton(
                onPressed: () {
                  Game.letterList = [];
                  Game.tries = 0;
                  Game.selectChar = [];
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomeApp()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Try Again', style: TextStyle(fontSize: 25, color: Colors.white)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
