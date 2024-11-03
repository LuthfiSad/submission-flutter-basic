import 'package:flutter/material.dart';
import 'package:submission_flutter/model/product_model.dart';
import 'package:submission_flutter/screens/detail_screen.dart';
import 'package:submission_flutter/screens/main_manu_screen.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItem> cartItems = [
    CartItem(product: productsList[0], quantity: 1),
    CartItem(product: productsList[1], quantity: 2),
  ];

  String selectedAddress = '';
  String couponCode = '';
  double shippingCost = 5000; // Contoh biaya pengiriman
  double discount = 0; // Contoh diskon

  @override
  Widget build(BuildContext context) {
    double totalPrice = cartItems.fold(
      0,
      (sum, item) =>
          sum +
          (double.parse(item.product.price.replaceAll('.', '')) *
              item.quantity),
    );
    print(totalPrice);
    double finalPrice = totalPrice - discount + shippingCost;

    return Padding(
      // Menggunakan SingleChildScrollView
      padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
      child: Column(
        children: [
          // Menggunakan Container dengan tinggi otomatis
          Container(
            height:
                MediaQuery.of(context).size.height * 0.5, // Atur tinggi tetap
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return CartItemWidget(
                  cartItem: cartItems[index],
                  onQuantityChanged: (newQuantity) {
                    setState(() {
                      cartItems[index].quantity = newQuantity;
                    });
                  },
                );
              },
            ),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Pilih Alamat'),
            onChanged: (value) {
              setState(() {
                selectedAddress = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Masukkan Kupon'),
            onChanged: (value) {
              setState(() {
                couponCode = value;
              });
            },
          ),
          SizedBox(height: 10),
          Text('Biaya Pengiriman: ${shippingCost.toString()}'),
          Text('Total Diskon: ${discount.toString()}'),
          Divider(),
          Text('Total: ${finalPrice.toString()}'),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(top: 16),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(16),
                backgroundColor: Theme.of(context).colorScheme.onSurface,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                // alert success alu kembali ke MainMenuScreen
                showDialog(
                    context: context,
                    builder: (builder) => AlertDialog(
                          title: Text("Pesan Berhasil"),
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
              child: Text("Pesan", style: TextStyle(color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, required this.quantity});
}

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  final Function(int) onQuantityChanged;

  const CartItemWidget({
    Key? key,
    required this.cartItem,
    required this.onQuantityChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailScreen(product: cartItem.product),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Image.network(
                cartItem.product.image,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cartItem.product.title,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(height: 4),
                    Text('Harga: ${cartItem.product.price}'),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                          ),
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            if (cartItem.quantity > 1) {
                              onQuantityChanged(cartItem.quantity - 1);
                            }
                          },
                        ),
                        SizedBox(width: 8),
                        Text('Kuantitas: ${cartItem.quantity}'),
                        SizedBox(width: 8),
                        IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                          ),
                          icon: Icon(Icons.add),
                          onPressed: () {
                            onQuantityChanged(cartItem.quantity + 1);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
