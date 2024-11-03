import 'package:flutter/material.dart';
import 'package:submission_flutter/model/product_model.dart';
import 'package:submission_flutter/screens/detail_screen.dart';

// Page 1
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Product> filteredProducts = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Mulai dengan menampilkan semua produk saat pertama kali halaman dibuka
    filteredProducts = productsList;
  }

  void _submitSearch() async {
    setState(() {
      _isLoading = true;
    });
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Eccomerce Information'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              Table(
                border: TableBorder.all(color: Colors.grey),
                children: [
                  TableRow(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Search',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(_searchController.text),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );

    setState(() {
      filteredProducts = _filteringSearchProducts(productsList);
      _isLoading = false;
    });
  }

  List<Product> _filteringSearchProducts(List<Product> productsList) {
    if (_searchController.text.isEmpty) {
      return productsList;
    }
    if (_searchController.text.isNotEmpty) {
      return productsList
          .where((product) => product.title
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
    } else {
      return List<Product>.empty();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 70.0, 20.0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Eccomerce',
              style: TextStyle(
                  fontSize: 30.0,
                  color: Theme.of(context).colorScheme.onSurface)),
          const Text(
            'Welcome to our store',
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                      hintText: 'Shoes',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      // prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      suffixIcon: _searchController.text.isEmpty && !_isLoading
                          ? null
                          : IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                _searchController.clear();
                                setState(() {
                                  filteredProducts = productsList;
                                });
                              },
                            )),
                  enabled: !_isLoading,
                ),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: _isLoading
                    ? null
                    : () {
                        _submitSearch();
                      },
                child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSurface,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: _isLoading
                        ? Container(width: 28, height: 28, padding: EdgeInsets.all(8),child: const CircularProgressIndicator(color: Colors.white,))
                        : const Icon(Icons.search,
                            size: 28, color: Colors.white)),
              ),
            ],
          ),
          const SizedBox(height: 40),
          if (filteredProducts.isNotEmpty) ...[
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              childAspectRatio: 0.63,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 15.0,
              physics: const NeverScrollableScrollPhysics(),
              children: filteredProducts.map((product) {
                return SuggestionItemCard(product: product);
              }).toList(),
            )
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     mainAxisSize: MainAxisSize.min,
            //     children: _filteringSearchProducts(productsList).map((product) {
            //       return SuggestionItemCard(product: product);
            //     }).toList(),
            //   ),
            // )
          ] else ...[
            Center(
              child: Column(
                children: [
                  Icon(Icons.search, size: 80, color: Colors.grey[400]),
                  // SizedBox(height: 10),
                  const Text(
                    'Item not found',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 40),
          const Text('Suggestion Item', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(suggestionList.length, (index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(right: 16.0), // Jarak antar item
                  child: SuggestionItemCard(product: suggestionList[index]),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class SuggestionItemCard extends StatelessWidget {
  final Product product;

  const SuggestionItemCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    double rating = double.parse(product.rating); // Rating dari 0 - 5
    double starFillRatio = rating / 5; // Rasio pengisian bintang

    return Container(
      width: MediaQuery.of(context).size.width / 2 - 28,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailScreen(product: product),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
                child: Image.network(
                  product.image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2, // Membatasi teks hingga 3 baris
                    overflow: TextOverflow
                        .ellipsis, // Menambahkan "..." jika teks terlalu panjang
                  ),
                  Row(
                    children: [
                      Stack(
                        children: [
                          Icon(Icons.star, size: 20, color: Colors.grey[400]),
                          ClipRect(
                            child: Align(
                              alignment: Alignment.topLeft,
                              widthFactor:
                                  starFillRatio, // Mengisi bintang sesuai rating
                              child: Icon(Icons.star,
                                  size: 20, color: Colors.yellow),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '$rating/5.0',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        // '(${product.ratingCount})',
                        '(10)',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Stock: ${product.stock}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                    ),
                  ),
                  Text(
                    'Rp ${product.price}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
