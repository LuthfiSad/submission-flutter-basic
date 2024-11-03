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
import 'package:google_fonts/google_fonts.dart';
import 'package:submission_flutter/screens/main_manu_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Submission Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          onSurface: const Color.fromARGB(255, 37, 0, 117),
          seedColor: Colors.white,
        ),
        textTheme: GoogleFonts.montserratTextTheme(),
        useMaterial3: true,
      ),
      // home: TodoAppPage(),
      // home: LoginPage(),
      // home: DrawerPage(),
      // home: TopBottomPage(),
      // home: TodoApp2Page(),
      // home: WalletPage(),
      // home: SearchPage(),
      // home: ListGalerry(),
      // home: SliderPage(),
      home: const MainMenuScreen(),
    );
  }
}
