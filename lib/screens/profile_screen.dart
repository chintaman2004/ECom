// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => logout(context),
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Center(
            child: CircleAvatar(
              radius: 40,
              backgroundImage: const NetworkImage(
                "https://i.pravatar.cc/150?img=7",
              ),
              backgroundColor: Colors.grey.shade200,
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: Text(
              user?.email ?? "fscreation@gmail.com",
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
          const SizedBox(height: 20),
          _buildSection([
            _buildTile(Icons.person, "Personal Details"),
            _buildTile(Icons.shopping_bag, "My Orders"),
            _buildTile(Icons.favorite, "My Favourites"),
            _buildTile(Icons.location_on, "Shipping Address"),
            _buildTile(Icons.credit_card, "My Card"),
            _buildTile(Icons.settings, "Settings"),
          ]),
          const SizedBox(height: 20),
          _buildSection([
            _buildTile(Icons.help_outline, "FAQs"),
            _buildTile(Icons.privacy_tip, "Privacy Policy"),
          ]),
        ],
      ),
    );
  }

  Widget _buildTile(IconData icon, String label) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(label),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // Optional: Handle tap navigation
      },
    );
  }

  Widget _buildSection(List<Widget> tiles) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(children: tiles),
    );
  }
}
