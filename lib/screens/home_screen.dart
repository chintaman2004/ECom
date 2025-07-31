import 'package:flutter/material.dart';
import 'product_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, dynamic>> newArrivals = [
    {
      'title': 'Leather Handbag',
      'price': "1,200",
      'image':
          'https://images.pexels.com/photos/3908800/pexels-photo-3908800.jpeg',
      'description': 'Premium quality leather handbag for modern women.',
    },
    {
      'title': 'Running Shoes',
      'price': "8,500",
      'image':
          'https://images.pexels.com/photos/29342144/pexels-photo-29342144.jpeg',
      'description': 'Comfortable and durable running shoes for all terrains.',
    },
  ];

  final List<Map<String, dynamic>> regularItems = [
    {
      'title': 'Smartwatch Series 6',
      'price': "19,999",
      'image':
          'https://images.pexels.com/photos/11677077/pexels-photo-11677077.jpeg',
      'description': 'Stay connected with the latest smartwatch technology.',
    },
    {
      'title': 'Winter Jacket',
      'price': "1,500",
      'image':
          'https://images.pexels.com/photos/3156217/pexels-photo-3156217.jpeg',
      'description': 'Warm and stylish jacket perfect for cold weather.',
    },
    {
      'title': 'Bluetooth Headphones',
      'price': "7,000",
      'image':
          'https://images.pexels.com/photos/15840650/pexels-photo-15840650.jpeg',
      'description': 'Noise-cancelling wireless headphones with deep bass.',
    },
  ];

  Widget buildProductSection(
    BuildContext context,
    String title,
    List<Map<String, dynamic>> products,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
          child: Text(
            title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        ...products.map((product) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: ListTile(
              leading: Image.network(
                product['image'],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(product['title']),
              subtitle: Text("Rs. ${product['price']}"),
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
        }),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: ListView(
        children: [
          buildProductSection(context, "🆕 New Arrivals", newArrivals),
          const Divider(),
          buildProductSection(context, "✨ Regular Items", regularItems),
        ],
      ),
    );
  }
}
