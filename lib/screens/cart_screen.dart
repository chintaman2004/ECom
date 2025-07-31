import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Your Cart")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                final item = cartProvider.cartItems[index];
                return ListTile(
                  leading: Image.network(item['image'], width: 50, height: 50),
                  title: Text(item['name']),
                  subtitle: Text("\$${item['price']}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => cartProvider.removeFromCart(item),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  "Total: \$${cartProvider.totalPrice.toStringAsFixed(2)}",
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    cartProvider.clearCart();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Checkout successful")),
                    );
                  },
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
