import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final Map<String, dynamic> product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int selectedSize = 41;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.product['title'])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(widget.product['image']),
            const SizedBox(height: 20),
            Text(widget.product['description']),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: [39, 40, 41, 42].map((size) {
                return ChoiceChip(
                  label: Text(size.toString()),
                  selected: selectedSize == size,
                  onSelected: (_) => setState(() => selectedSize = size),
                );
              }).toList(),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Added to cart (local state)")),
                );
              },
              child: Text("Add to cart - \$${widget.product['price']}"),
            ),
          ],
        ),
      ),
    );
  }
}
