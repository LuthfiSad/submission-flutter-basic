import 'package:flutter/material.dart';
import 'package:submission_flutter/model/product_model.dart';
import 'package:submission_flutter/screens/main_manu_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String activeTab = 'description';
  String? activeSize;
  double initialChildSize = 0.6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 500.0,
                ),
                child: Image.network(
                  widget.product.image,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Draggable Scrollable Sheet dengan auto snap ke min atau max size
            NotificationListener<DraggableScrollableNotification>(
              onNotification: (notification) {
                if (notification.extent > 0.7 && initialChildSize == 0.5) {
                  setState(() => initialChildSize = 1.0);
                } else if (notification.extent < 0.7 &&
                    initialChildSize == 1.0) {
                  setState(() => initialChildSize = 0.5);
                }
                return true;
              },
              child: DraggableScrollableSheet(
                initialChildSize: initialChildSize,
                minChildSize: initialChildSize,
                maxChildSize: 1.0,
                builder: (context, scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          // spreadRadius: 2,
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(0, -4),
                        )
                      ],
                    ),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            minHeight: 630.0,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Title, Price, Stock, Rating
                                  Text(widget.product.title,
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold)),

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Stack(
                                            children: [
                                              Icon(Icons.star,
                                                  size: 30,
                                                  color: Colors.grey[400]),
                                              ClipRect(
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  widthFactor: double.parse(
                                                          widget
                                                              .product.rating) /
                                                      5, // Mengisi bintang sesuai rating
                                                  child: Icon(Icons.star,
                                                      size: 30,
                                                      color: Colors.yellow),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            '${double.parse(widget.product.rating)}/5.0',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            '(${widget.product.ratingCount})',
                                            // '(10)',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text("Stock: ${widget.product.stock}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey)),
                                    ],
                                  ),
                                  Text("Price: ${widget.product.price}",
                                      style: TextStyle(
                                          fontSize: 24, color: Colors.green)),

                                  // Size Options with Active Animation
                                  if (widget.product.size != null)
                                    Wrap(
                                      children:
                                          widget.product.size!.map((size) {
                                        bool isActive = size == activeSize;
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              activeSize = size;
                                            });
                                          },
                                          child: AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 200),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 4, vertical: 8),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 8),
                                            decoration: BoxDecoration(
                                              color: isActive
                                                  ? Theme.of(context).colorScheme.onSurface
                                                  : Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Text(
                                              size,
                                              style: TextStyle(
                                                  color: isActive
                                                      ? Colors.white
                                                      : Colors.black),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),

                                  // Tab Navigation for Description and Reviews
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      _buildTabButton(
                                          'description', 'Description'),
                                      SizedBox(width: 8),
                                      _buildTabButton('review', 'Reviews'),
                                    ],
                                  ),
                                  Divider(),

                                  // Content based on Active Tab
                                  if (activeTab == 'description' &&
                                      widget.product.description != null)
                                    Text(widget.product.description!,
                                        style: TextStyle(fontSize: 16)),
                                  if (activeTab == 'review' &&
                                      widget.product.review != null)
                                    ...widget.product.review!.map((rev) {
                                      double ratingRev = double.parse(
                                          rev.rating); // Rating dari 0 - 5
                                      double starFillRatio = ratingRev / 5;
                                      return ListTile(
                                        title: Text(rev.username),
                                        leading: CircleAvatar(
                                          backgroundImage:
                                              NetworkImage(rev.image),
                                        ),
                                        subtitle: Text(rev.comment),
                                        trailing: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(rev.date),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Stack(
                                                  children: [
                                                    Icon(Icons.star,
                                                        size: 20,
                                                        color:
                                                            Colors.grey[400]),
                                                    ClipRect(
                                                      child: Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        widthFactor:
                                                            starFillRatio, // Mengisi bintang sesuai rating
                                                        child: Icon(Icons.star,
                                                            size: 20,
                                                            color:
                                                                Colors.yellow),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(width: 4),
                                                Text(
                                                  '$ratingRev/5.0',
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 16),
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(16),
                                    backgroundColor:
                                        Theme.of(context).colorScheme.onSurface,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (builder) => AlertDialog(
                                              title: Text(
                                                  "Masuk keranjang Berhasil"),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            MainMenuScreen(),
                                                      ),
                                                    );
                                                  },
                                                  child: Text("Kembali"),
                                                ),
                                              ],
                                            ));
                                  },
                                  child: Text("Add to cart",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            Positioned(
              top: 16,
              left: 16,
              child: CircleAvatar(
                backgroundColor: Colors.black54,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper to create Tab Button
  Widget _buildTabButton(String tab, String title) {
    bool isActive = activeTab == tab;
    return GestureDetector(
      onTap: () {
        setState(() {
          activeTab = tab;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isActive
              ? Theme.of(context).colorScheme.onSurface
              : Colors.grey[300],
        ),
        child: Text(
          title,
          style: TextStyle(color: isActive ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
