import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService { 
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  Future signOut() async {
    try{
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
}


// class UploadImage extends ImageController {
//   Future uploadFile() async {
//     final path = 'files/${pickedFile!}';

//     final ref = FirebaseStorage.instance.ref().child(path);
//     //ref.putFile(File(_pickedFile!.path));
//     ref.putFile(File(pickedOFile!.path));
//   }
// }