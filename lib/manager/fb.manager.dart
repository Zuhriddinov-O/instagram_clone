import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class FbManager {
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseDatabase.instance;
  final _storage = FirebaseStorage.instance;

  User? getUser() => _auth.currentUser;

  Future<bool> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<bool> register(String email, String password, String fullName,
      String bio, File image) async {
    try {
      final registorResponse = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (registorResponse.user == null) {
        return false;
      }
      final imageId = DateTime.now().microsecondsSinceEpoch.toString();
      final uploadTask =
          await _storage.ref('user_image/$imageId').putFile(image);
      final imageUrl = await uploadTask.ref.getDownloadURL();

      final newUser = {
        'uid': registorResponse.user?.uid,
        'image': imageUrl,
        'email': email,
        'userName': fullName,
        'bio': bio,
        'password': password,
        'post_count': 0,
        'following_count': 0,
        'follower_count': 0,
      };
      await _db.ref('user/${registorResponse.user?.uid}').set(newUser);
      return false;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
