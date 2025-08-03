import 'package:flutter/material.dart';
import 'product_detail_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _currentIndex = 0;

  final List<Map<String, dynamic>> newArrivals = [
    {
      'title': 'Leather Jacket',
      'price': '2500',
      'image':
          'https://images.pexels.com/photos/1124468/pexels-photo-1124468.jpeg',
      'description': 'Stylish leather jacket for all seasons.',
    },
    {
      'title': 'Smartwatch Pro',
      'price': '4500',
      'image':
          'https://images.pexels.com/photos/267394/pexels-photo-267394.jpeg',
      'description': 'Advanced features and water resistant.',
    },
    {
      'title': 'Dress hangers',
      'price': '500',
      'image':
          'https://images.pexels.com/photos/8306367/pexels-photo-8306367.jpeg',
      'description': 'Advanced features and water resistant.',
    },
    {
      'title': 'Black Friday Title',
      'price': '5000',
      'image':
          'https://images.pexels.com/photos/5926438/pexels-photo-5926438.jpeg',
      'description': 'Advanced features and water resistant.',
    },
    {
      'title': 'Steel Basket for Shopping',
      'price': '9500',
      'image':
          'https://images.pexels.com/photos/5926217/pexels-photo-5926217.jpeg',
      'description': 'Advanced features and water resistant.',
    },
    {
      'title': 'Cloth Bags For Shopping',
      'price': '100',
      'image':
          'https://images.pexels.com/photos/3570079/pexels-photo-3570079.jpeg',
      'description': 'Advanced features and water resistant.',
    },
    {
      'title': 'Board Marker',
      'price': '300',
      'image':
          'https://images.pexels.com/photos/4057737/pexels-photo-4057737.jpeg',
      'description': 'Advanced features and water resistant.',
    },
    {
      'title': 'Broom',
      'price': '250',
      'image':
          'https://images.pexels.com/photos/15672286/pexels-photo-15672286.jpeg',
      'description': 'Advanced features and water resistant.',
    },
    {
      'title': 'Paper Bags',
      'price': '85',
      'image':
          'https://images.pexels.com/photos/5956/gift-brown-shopping-market.jpg',
      'description': 'Advanced features and water resistant.',
    },
    {
      'title': 'Nail Polish',
      'price': '3000',
      'image':
          'https://images.pexels.com/photos/18026566/pexels-photo-18026566.jpeg',
      'description': 'Advanced features and water resistant.',
    },
    {
      'title': 'Black Hanging Bag',
      'price': '1700',
      'image':
          'https://images.pexels.com/photos/14131907/pexels-photo-14131907.jpeg',
      'description': 'Advanced features and water resistant.',
    },
    {
      'title': 'Shopping cloth Basket',
      'price': '365',
      'image':
          'https://images.pexels.com/photos/21624841/pexels-photo-21624841.jpeg',
      'description': 'Advanced features and water resistant.',
    },
    {
      'title': 'Dress hangers',
      'price': '650',
      'image':
          'https://images.pexels.com/photos/8306367/pexels-photo-8306367.jpeg',
      'description': 'Advanced features and water resistant.',
    },
    {
      'title': 'Key Chain',
      'price': '780',
      'image':
          'https://images.pexels.com/photos/18889463/pexels-photo-18889463.jpeg',
      'description': 'Advanced features and water resistant.',
    },
    {
      'title': 'Oil Dropper',
      'price': '700',
      'image':
          'https://images.pexels.com/photos/16012117/pexels-photo-16012117.jpeg',
      'description': 'Advanced features and water resistant.',
    },
    {
      'title': 'Keys Set',
      'price': '857',
      'image':
          'https://images.pexels.com/photos/8306367/pexels-photo-8306367.jpeg',
      'description': 'Advanced features and water resistant.',
    },
    {
      'title': 'Ink Bottle',
      'price': '325',
      'image':
          'https://images.pexels.com/photos/5994299/pexels-photo-5994299.jpeg',
      'description': 'Advanced features and water resistant.',
    },
    {
      'title': 'Reel Cassete',
      'price': '125',
      'image':
          'https://images.pexels.com/photos/1762411/pexels-photo-1762411.jpeg',
      'description': 'Advanced features and water resistant.',
    },
    {
      'title': 'Stylsh Headset',
      'price': '950',
      'image':
          'https://images.pexels.com/photos/8003585/pexels-photo-8003585.jpeg',
      'description': 'Advanced features and water resistant.',
    },
    {
      'title': 'Steel Cloth Stand',
      'price': '655',
      'image':
          'https://images.pexels.com/photos/7262894/pexels-photo-7262894.jpeg',
      'description': 'Advanced features and water resistant.',
    },
    {
      'title': 'Drilling Machine',
      'price': '50000',
      'image':
          'https://images.pexels.com/photos/4792482/pexels-photo-4792482.jpeg',
      'description': 'Advanced features and water resistant.',
    },
    {
      'title': 'Gold Ring',
      'price': '9520',
      'image':
          'https://images.pexels.com/photos/4943485/pexels-photo-4943485.jpeg',
      'description': 'Advanced features and water resistant.',
    },
    {
      'title': 'Bottle Cap',
      'price': '25',
      'image':
          'https://images.pexels.com/photos/3752036/pexels-photo-3752036.jpeg',
      'description': 'Advanced features and water resistant.',
    },
    {
      'title': 'Suite',
      'price': '15000',
      'image':
          'https://images.pexels.com/photos/6969905/pexels-photo-6969905.jpeg',
      'description': 'Advanced features and water resistant.',
    },
  ];

  final List<Map<String, dynamic>> regularItems = [
    {
      'title': 'Cotton T-shirt',
      'price': '800',
      'image':
          'https://images.pexels.com/photos/428340/pexels-photo-428340.jpeg',
      'description': 'Soft and breathable cotton T-shirt.',
    },
    {
      'title': 'Running Shoes',
      'price': '2200',
      'image':
          'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg',
      'description': 'Comfortable shoes for daily use.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentIndex == 0
          ? _buildHomeBody(context)
          : const ProfileScreen(),
    );
  }

  Widget _buildHomeBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sectionHeader("New Arrivals"),
          productGrid(newArrivals, context),
          sectionHeader("Regular Products"),
          productGrid(regularItems, context),
        ],
      ),
    );
  }

  Widget sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget productGrid(
    List<Map<String, dynamic>> products,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.6,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailScreen(product: product),
                ),
              );
            },
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                      child: Image.network(
                        product['image'],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      product['title'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Text(
                      "Rs. ${product['price']}",
                      style: const TextStyle(color: Colors.deepPurple),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
