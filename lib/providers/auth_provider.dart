import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  bool _isAdmin = false;

  User? get user => _user;
  bool get isAdmin => _isAdmin;

  AuthProvider() {
    _auth.authStateChanges().listen(_onAuthStateChanged);
  }

  Future<void> _onAuthStateChanged(User? user) async {
    _user = user;
    if (user != null) {
      await _checkAdminRole(user.uid);
    } else {
      _isAdmin = false;
    }
    notifyListeners();
  }

  Future<void> _checkAdminRole(String uid) async {
    try {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();
      if (userDoc.exists) {
        _isAdmin = userDoc.data()?['role'] == 'admin';
      } else {
        _isAdmin = false;
      }
    } catch (e) {
      _isAdmin = false;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
