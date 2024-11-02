import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      body: Stack(
        children: [
          // Latar belakang atau konten utama
          SizedBox(
            height: 400,
            child: Center(
              child: Icon(
                Icons.ac_unit, // Ganti dengan ikon yang kamu inginkan
                size: 100,
                color: Colors.grey[400],
              ),
            ),
          ),
          // DraggableScrollableSheet sebagai drawer di bawah
          DraggableScrollableSheet(
            initialChildSize: 0.3, // ukuran awal
            minChildSize: 0.1, // ukuran minimum
            maxChildSize: 0.5, // ukuran maksimum
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                alignment: Alignment.topCenter,
                // child: Icon(
                //       Icons.keyboard_arrow_up_rounded,
                //       size: 40,
                //       color: Colors.grey[400],
                //     ),
                child: ListView(
                  padding: const EdgeInsets.only(top: 0),
                  controller: scrollController,
                  children: [
                    Center(
                      child: Icon(
                        Icons.keyboard_arrow_up_rounded,
                        size: 40,
                        color: Colors.grey[400],
                      ),
                      // child: Container(
                      //   width: 50,
                      //   height: 5,
                      //   decoration: BoxDecoration(
                      //     color: Colors.grey[300],
                      //     borderRadius: BorderRadius.circular(10),
                      //   ),
                      // ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Lorem ipsum dolor sit amet",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                      "Nunc in ex eu lectus suscipit ornare. Duis rhoncus molestie ex, "
                      "sit amet ultricies tellus pretium nec.",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
