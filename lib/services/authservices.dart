// // ignore_for_file: unnecessary_null_comparison, recursive_getters
// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/cupertino.dart';

// //import '../models/user.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class AuthService with ChangeNotifier {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   bool _isLoading = false;
//   String? _errorMessage;
//   String? get errorMessage => _errorMessage;
//   bool get isLoading => _isLoading;

//   Future register(String email, String password) async {
//     setLoading(true);
//     try {
//       UserCredential authResult = await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       User? user = authResult.user;
//       setLoading(false);
//       return user;
//     } on SocketException {
//       setLoading(false);
//       setMessage("No internet, please check connection and try again!");
//     } catch (e) {
//       setLoading(false);
//       setMessage(e.toString());
//     }
//     notifyListeners();
//   }

//   Future login(String email, String password) async {
    
//     try {
//       setLoading(true);
//       UserCredential authResult = await _auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       User? user = authResult.user;
//       setLoading(false);
//       return user;
//     } on SocketException {
//       setLoading(false);
//       setMessage("No internet, please check connection and try again!");
//     } catch (e) {
//       setLoading(false);
//       setMessage(e.toString());
//     }
//     notifyListeners();
//   }

//   Future logout() async {
//     await _auth.signOut();
//   }

//   void setLoading(val) {
//     _isLoading = val;
//     notifyListeners();
//   }

//   void setMessage(message) {
//     _errorMessage = message;
//     notifyListeners();
//   }

//   Stream<User?> get user => _auth.authStateChanges().map((event) => event);

//   //--------------------------------------------------------------------------------------

//   // Future signInAnon() async {
//   //   try {
//   //     UserCredential result = await _auth.signInAnonymously();
//   //     User? user = result.user;
//   //     return user;
//   //   } catch (e) {
//   //     print(e.toString());
//   //     return null;
//   //   }
//   // }
// }


import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_appointment/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  UserModel? _userFromFirebase(User? user) {
    if (user == null) {
      return null;
    }
    return UserModel(
        uid: user.uid,
        );
  }

  Stream<UserModel?> get user {
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  // login user
  Future<UserModel?> signInWithEmailAndPassword(
      String email, String password) async {
    final credential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
   
   
    return _userFromFirebase(credential.user);
  }

// create a new user
  Future<UserModel?> createUserWithEmailAndPassword(
      String email, String password, ) async {
    final credential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    //await credential.user!.updateDisplayName(displayName);
    // create a firestore collection for users
    await _firebaseFirestore.collection('users').doc(credential.user!.uid).set({
      'uid': credential.user!.uid,
     
    }, SetOptions(merge: true));
    return _userFromFirebase(credential.user);
  }
// create a new user
  Future<UserModel?> createProfessionalWithEmailAndPassword(String displayName,
      String email,String profession, String password, String dob, String bio) async {
    final credential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    await credential.user!.updateDisplayName(displayName);
    // create a firestore collection for users
    await _firebaseFirestore.collection('professional').doc(credential.user!.uid).set({
      'uid': credential.user!.uid,
      
    }, SetOptions(merge: true));
    return _userFromFirebase(credential.user);
  }

// logout from app
  Future<void> signOut() async {
    return await _auth.signOut();
  }

  Future<void> forgottenPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      log(e.toString());
    }
  }
}