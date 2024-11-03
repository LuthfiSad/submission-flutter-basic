import 'package:flutter/material.dart';
import 'package:submission_flutter/widget/costum_navigation.dart';
import 'home_screen.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 130.0),
                child: _buildContent(currentPage),
              ),
            ),
          ),
          CustomBottomNavigation(
            currentPage: currentPage,
            onItemSelected: (index) {
              setState(() {
                currentPage = index;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildContent(int currentPage) {
    switch (currentPage) {
      case 0:
        return const HomeScreen();
      case 2:
        return const HomeScreen();
      case 3:
        return const HomeScreen();

      default:
        return const HomeScreen();
    }
  }
}
