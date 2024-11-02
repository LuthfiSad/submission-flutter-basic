import 'package:flutter/material.dart';
import 'package:submission_flutter/example/authenticate.dart';
import 'package:submission_flutter/example/list_galerry.dart';
import 'package:submission_flutter/example/search.dart';
import 'package:submission_flutter/example/slider.dart';
import 'package:submission_flutter/example/drawer.dart';
import 'package:submission_flutter/example/todo_app.dart';
import 'package:submission_flutter/example/todo_app2.dart';
import 'package:submission_flutter/example/topbottom.dart';
import 'package:submission_flutter/example/wallet.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Submission Flutter',
      // home: TodoAppPage(),
      // home: LoginPage(),
      // home: DrawerPage(),
      // home: TopBottomPage(),
      // home: TodoApp2Page(),
      // home: WalletPage(),
      // home: SearchPage(),
      // home: ListGalerry(),
      home: SliderPage(),
    );
  }
}
