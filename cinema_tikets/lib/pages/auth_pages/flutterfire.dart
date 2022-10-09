
//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:image_picker/image_picker.dart';

Future<bool> logIn(String email, String password) async{
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password,);
    return true;
  }catch (e){
    print(e);
    return false;
  }
}

Future<bool> signIn(String email, String password, String name, String contact) async{
  TextEditingController _usernameField = TextEditingController();
  TextEditingController _contactField = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  try {
    UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(email: email,password: password);
    // User? firebaseUser = result.user;
    // firebaseUser?.updateDisplayName(name);
    // firebaseUser?.reload();
    var user = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance.collection('users').add({
      'uniqueID': user!.uid,
      'username': name,         // _usernameField.text.trim(),
      'contact': contact,
    });
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    }
    else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
    return false;
  } catch (e){
    print(e.toString());
    return false;
  }
}


// class ProfilePicture extends StatefulWidget {
//   const ProfilePicture({super.key});

//   @override
//   State<ProfilePicture> createState() => _ProfilePictureState();
// }

// class _ProfilePictureState extends State<ProfilePicture> {
  
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
