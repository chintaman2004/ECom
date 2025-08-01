// ignore_for_file: avoid_print

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? imageUrl;
  bool isLoading = false;

  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    loadProfileImage();
  }

  Future<void> loadProfileImage() async {
    if (currentUser != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.uid)
          .get();

      setState(() {
        imageUrl = userDoc['profilePic'];
      });
    }
  }

  Future<void> pickAndUploadImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null && currentUser != null) {
      setState(() {
        isLoading = true;
      });

      File file = File(pickedFile.path);
      String fileName = '${currentUser!.uid}.jpg';
      try {
        final ref = FirebaseStorage.instance
            .ref()
            .child('profilePics')
            .child(fileName);
        await ref.putFile(file);
        String downloadUrl = await ref.getDownloadURL();

        await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser!.uid)
            .set({'profilePic': downloadUrl}, SetOptions(merge: true));

        setState(() {
          imageUrl = downloadUrl;
          isLoading = false;
        });
      } catch (e) {
        print("Upload failed: $e");
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isLoading
          ? const CircularProgressIndicator()
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: pickAndUploadImage,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: imageUrl != null
                        ? NetworkImage(imageUrl!)
                        : null,
                    backgroundColor: Colors.deepPurple,
                    child: imageUrl == null
                        ? const Icon(
                            Icons.person,
                            size: 60,
                            color: Colors.white,
                          )
                        : null,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Tap the icon to change profile picture",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
    );
  }
}
