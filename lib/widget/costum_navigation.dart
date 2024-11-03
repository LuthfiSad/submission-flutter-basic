import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentPage;
  final ValueChanged<int> onItemSelected;

  const CustomBottomNavigation({
    super.key,
    required this.currentPage,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
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
                BuildNavigationItem(
                  index: 0,
                  icon: Icons.home_filled,
                  isSelected: currentPage == 0,
                  onTap: onItemSelected,
                ),
                const SizedBox(width: 60),
                BuildNavigationItem(
                  index: 3,
                  icon: MdiIcons.account,
                  isSelected: currentPage == 3,
                  onTap: onItemSelected,
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: BuildNavigationMiddle(
              index: 2,
              icon: MdiIcons.cart,
              isSelected: currentPage == 2,
              onTap: onItemSelected,
            ),
          )
        ],
      ),
    );
  }
}

class BuildNavigationMiddle extends StatelessWidget {
  final IconData icon;
  final int index;
  final bool isSelected;
  final ValueChanged<int> onTap;

  const BuildNavigationMiddle({
    Key? key,
    required this.icon,
    required this.index,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(0, -4),
            )
          ],
        ),
        child: InkWell(
          onTap: () => onTap(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: isSelected ? Theme.of(context).colorScheme.onSurface : null,
              border: Border.all(color: Colors.black, width: 3),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 40,
              color: isSelected ? Colors.white : Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}

class BuildNavigationItem extends StatelessWidget {
  final IconData icon;
  final int index;
  final bool isSelected;
  final ValueChanged<int> onTap;

  const BuildNavigationItem({
    Key? key,
    required this.icon,
    required this.index,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14.0),
        child: InkWell(
          onTap: () => onTap(index),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 30,
                color: isSelected ? Theme.of(context).colorScheme.onSurface : Colors.grey,
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 4,
                width: isSelected ? 20 : 0,
                decoration: BoxDecoration(
                  color: isSelected ? Theme.of(context).colorScheme.onSurface : Colors.transparent,
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
