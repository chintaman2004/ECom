// ignore_for_file: unused_element, avoid_print

import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

File? _profileImage;

Future<void> _pickImage() async {
  final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (picked != null) {
    _profileImage = File(picked.path);
  }
}

Future<String?> _uploadProfileImage(String uid) async {
  if (_profileImage == null) return null;

  final ref = FirebaseStorage.instance
      .ref()
      .child('user_profiles')
      .child('$uid.jpg');
  await ref.putFile(_profileImage!);
  return await ref.getDownloadURL();
}

Future<void> _signup(String email, String password, String name) async {
  try {
    final userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    final uid = userCredential.user!.uid;
    final imageUrl = await _uploadProfileImage(uid);

    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'name': name,
      'email': email,
      'profilePic': imageUrl,
    });

    // Navigate to success screen
  } catch (e) {
    print('Signup Error: $e');
  }
}
