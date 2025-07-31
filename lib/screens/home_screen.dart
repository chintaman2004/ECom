import 'package:flutter/material.dart';
import 'product_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, dynamic>> products = List.generate(
    25,
    (index) => {
      'title': 'Product ${index + 1}',
      'price': 50.0 + (index * 3),
      'image': 'https://via.placeholder.com/150?text=Product+${index + 1}',
      'description': 'This is the description for Product ${index + 1}',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("New Arrivals")),
      body: ListView.builder(
        itemCount: products.length,
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: ListTile(
              leading: Image.network(product['image'], width: 50),
              title: Text(product['title']),
              subtitle: Text("\$${product['price']}"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetailScreen(product: product),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
