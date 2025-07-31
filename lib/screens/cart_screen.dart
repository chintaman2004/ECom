import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> cart = [];

  @override
  void initState() {
    super.initState();

    // Mock cart items - simulate local state
    cart = [
      {
        'title': 'Axel Arigato',
        'price': 245.00,
        'image': 'https://via.placeholder.com/150?text=Axel+Arigato',
      },
      {
        'title': 'Bag - Gucci',
        'price': 149.00,
        'image': 'https://via.placeholder.com/150?text=Gucci+Bag',
      },
    ];
  }

  void removeFromCart(int index) {
    setState(() {
      cart.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    double total = cart.fold(0, (sum, item) => sum + item['price']);

    return Scaffold(
      appBar: AppBar(title: const Text("Your Cart")),
      body: cart.isEmpty
          ? const Center(child: Text("Your cart is empty."))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];
                      return ListTile(
                        leading: Image.network(item['image'], width: 50),
                        title: Text(item['title']),
                        subtitle: Text("\$${item['price']}"),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => removeFromCart(index),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total: \$${total.toStringAsFixed(2)}",
                        style: const TextStyle(fontSize: 18),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("Checkout"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
