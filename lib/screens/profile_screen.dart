// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<Map<String, dynamic>?> _getUserData() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return null;

    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get();

    if (!snapshot.exists) {
      return null;
    }

    return snapshot.data();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: _getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            print('Error: ${snapshot.error}');
            return const Center(child: Text('Something went wrong.'));
          }

          if (!snapshot.hasData || snapshot.data == null) {
            print('No profile data found.');
            return const Center(child: Text('Failed to load profile.'));
          }

          final data = snapshot.data!;
          final name = data['name'] ?? 'No Name';
          final email = data['email'] ?? 'No Email';
          final profilePic = data['profilePic'];

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: profilePic != null && profilePic != ''
                      ? NetworkImage(profilePic)
                      : const AssetImage('assets/default_avatar.png')
                            as ImageProvider,
                ),
                const SizedBox(height: 20),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(email, style: const TextStyle(fontSize: 16)),
              ],
            ),
          );
        },
      ),
    );
  }
}
