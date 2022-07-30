import 'package:flutter/material.dart';

import 'package:forca/ui/colors.dart';

import 'HomeApp.dart';

class Lose extends StatelessWidget {
  const Lose({Key? key}) : super(key: key);

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
              'Você errou!',
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
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomeApp()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Tentar novamente.', style: TextStyle(fontSize: 25, color: Colors.white)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
