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
    return snapshot.data();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getUserData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const CircularProgressIndicator();
        final data = snapshot.data!;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: data['profilePic'] != null
                  ? NetworkImage(data['profilePic'])
                  : const AssetImage('assets/default_avatar.png')
                        as ImageProvider,
            ),
            const SizedBox(height: 20),
            Text(
              data['name'] ?? 'No Name',
              style: const TextStyle(fontSize: 22),
            ),
            Text(data['email'] ?? '', style: const TextStyle(fontSize: 16)),
          ],
        );
      },
    );
  }
}
