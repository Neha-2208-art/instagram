import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class StorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Uploads an image to Firebase Storage and returns the download URL.
  Future<String> uploadImageToStorage(
      String childName, Uint8List file, bool isPost) async {
    try {
      // Create a reference to the location in Firebase Storage
      Reference ref =
          _storage.ref().child(childName).child(_auth.currentUser!.uid);

      // Start the upload task
      UploadTask uploadTask = ref.putData(file);

      // Wait for the upload to complete
      TaskSnapshot snap = await uploadTask;

      // Get the download URL of the uploaded file
      String downloadUrl = await snap.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      // Handle any errors during the upload
      print('Error uploading image: $e');
      throw e;
    }
  }
}
