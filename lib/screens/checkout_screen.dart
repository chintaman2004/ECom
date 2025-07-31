import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  String paymentMethod = 'Cash on Delivery';

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Order Summary")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              "Contact Details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Full Name"),
            ),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(labelText: "Address"),
            ),
            TextField(
              controller: contactController,
              decoration: const InputDecoration(labelText: "Phone Number"),
            ),
            const SizedBox(height: 20),

            const Text(
              "Payment Method",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            RadioListTile(
              title: const Text("Cash on Delivery"),
              value: "Cash on Delivery",
              groupValue: paymentMethod,
              onChanged: (value) => setState(() => paymentMethod = value!),
            ),
            RadioListTile(
              title: const Text("Credit Card"),
              value: "Credit Card",
              groupValue: paymentMethod,
              onChanged: (value) => setState(() => paymentMethod = value!),
            ),

            const SizedBox(height: 20),
            Text(
              "Total Amount: Rs. ${cartProvider.totalPrice.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isEmpty ||
                    addressController.text.isEmpty ||
                    contactController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please fill all fields")),
                  );
                  return;
                }

                // Clear cart and show success message
                cartProvider.clearCart();
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text("Order Placed"),
                    content: const Text(
                      "Your order has been placed successfully.",
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // close dialog
                          Navigator.of(context).pop(); // go back to home/cart
                        },
                        child: const Text("OK"),
                      ),
                    ],
                  ),
                );
              },
              child: const Text("Place Order"),
            ),
          ],
        ),
      ),
    );
  }
}
