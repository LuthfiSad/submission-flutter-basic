import 'package:flutter/material.dart';
import 'package:submission_flutter/helper/data.dart';

// Page 2
class ListGalerry extends StatelessWidget {
  const ListGalerry({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[500],
        elevation: 0,
        title: const Text('Lorem Gallery', style: TextStyle(color: Colors.white)),
        // centerTitle: true,
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.more_vert, color: Colors.white),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Wrap(
            children: listImage.asMap().entries.map(
              (entry) {
                return GalleryItemCard(image: entry.value,);
              },
            ).toList(),
            // child: GridView.builder(
            //   itemCount: 4,
            //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2,
            //     crossAxisSpacing: 16,
            //     mainAxisSpacing: 16,
            //   ),
            //   itemBuilder: (context, index) {
            //     return GalleryItemCard();
            //   },
            // ),
          ),
        ),
      ),
    );
  }
}

class GalleryItemCard extends StatelessWidget {
  final String image;

  const GalleryItemCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width / 2) - 24,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(right: 8, bottom: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white, // Putih
            Colors.grey[100]!, // Hitam tipis
            Colors.grey.withOpacity(0.5), // Lebih pekat
          ],
          stops: const [0.75, 0.85, 1.0], // Mengatur transisi secara bertahap
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 250.0,
        ),
        child: IntrinsicHeight(
          child: Stack(
            fit: StackFit.expand,
            children: [
              const Center(child: Icon(Icons.image, size: 60, color: Colors.grey)),
              const Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.more_vert, color: Colors.grey)),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(image, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
