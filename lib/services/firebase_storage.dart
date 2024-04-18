import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart' as fs;

import '../controllers/auth_controller.dart';

class FirebaseStorage {


  fs.Reference? _getReference() {
    final userId = AuthController().userId;
    if (userId == null) {
      return null;
    }


  }
}
