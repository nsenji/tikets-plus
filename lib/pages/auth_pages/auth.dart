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


