import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              const CircleAvatar(
                radius: 55,
                backgroundImage: AssetImage("assets/images/org.png"),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSurface,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.edit,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          const Column(
            children: [
              Text(
                "luthfi",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "luthfi@gmail.com",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          const SizedBox(height: 30),
          CustomListTileProfile(
            title: "Account Info",
            icon: Icons.person,
            backgroundColor: Theme.of(context).colorScheme.onSurface,
          ),
          CustomListTileProfile(
            title: "Security Code",
            icon: Icons.shield_rounded,
            backgroundColor: Theme.of(context).colorScheme.onSurface,
          ),
          CustomListTileProfile(
            title: "Privacy Policy",
            icon: Icons.privacy_tip,
            backgroundColor: Theme.of(context).colorScheme.onSurface,
          ),
          CustomListTileProfile(
            title: "Your Wallet",
            icon: Icons.wallet,
            backgroundColor: Theme.of(context).colorScheme.onSurface,
          ),
          CustomListTileProfile(
            title: "Settings",
            icon: Icons.settings,
            backgroundColor: Theme.of(context).colorScheme.onSurface,
          ),
          const SizedBox(height: 30),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSurface,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
              child: Text(
                "Log Out",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomListTileProfile extends StatelessWidget {
  const CustomListTileProfile({
    super.key,
    required this.icon,
    required this.title,
    this.backgroundColor,
  });

  final IconData icon;
  final String title;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: backgroundColor!,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  size: 28,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 14),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 20,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
