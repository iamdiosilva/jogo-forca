import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forca/ui/colors.dart';

class Letter extends StatelessWidget {
  bool? hidden;
  String? character;
  Letter({Key? key, required this.hidden, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 50,
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: AppColor.primaryColorDark,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Visibility(
        visible: !hidden!,
        child: Text(
          character!,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 40.0,
          ),
        ),
      ),
    );
  }
}
