import 'dart:math';
import 'package:forca/views/HomeApp.dart';
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
      home: HomeApp(),
    );
  }
}
