import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:submission_flutter/screens/cart_screen.dart';
import 'package:submission_flutter/screens/profile_screen.dart';
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
          _customBottomNavigation(),
        ],
      ),
    );
  }

  _buildContent(int currentPage) {
    switch (currentPage) {
      case 0:
        return const HomeScreen();
      case 2:
        return CartScreen();
      case 3:
        return const ProfileScreen();

      default:
        const HomeScreen();
    }
  }

  Widget _customBottomNavigation() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 26),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 2,
                  color: Colors.black.withOpacity(0.3),
                  offset: const Offset(0, 6),
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildNavigationItem(
                  index: 0,
                  icon: Icons.home_filled,
                ),
                SizedBox(
                  width: 60,
                ),
                _buildNavigationItem(
                  index: 3,
                  icon: MdiIcons.account,
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _buildNavigationMiddle(
              index: 2,
              icon: MdiIcons.cart,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildNavigationMiddle({
    required IconData icon,
    required int index,
  }) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              // spreadRadius: 2,
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(0, -4),
            )
          ],
        ),
        child: InkWell(
          onTap: () {
            setState(() {
              currentPage = index;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: currentPage == index
                  ? Theme.of(context).colorScheme.onSurface
                  : null,
              border: Border.all(color: Theme.of(context).colorScheme.onSurface, width: 3),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 40,
              color: currentPage == index
                  ? Colors.white
                  : Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationItem({
    required IconData icon,
    required int index,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14.0),
        child: InkWell(
          onTap: () {
            setState(() {
              currentPage = index;
            });
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 30,
                color: currentPage == index
                    ? Theme.of(context).colorScheme.onSurface
                    : Colors.grey,
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 4,
                width: currentPage == index ? 20 : 0,
                decoration: BoxDecoration(
                  color: currentPage == index
                      ? Theme.of(context).colorScheme.onSurface
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
