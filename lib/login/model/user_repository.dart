import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

// track the status of the user.
enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserRepository extends ChangeNotifier{
  FirebaseAuth _firebaseAuth;
  FirebaseUser _firebaseUser;
  Status _status = Status.Uninitialized;

  UserRepository();

  UserRepository.instance() : _firebaseAuth = FirebaseAuth.instance {
    _firebaseAuth.onAuthStateChanged.listen(_onAuthStateChanged);
  }

  Status get status => _status;
  FirebaseUser get user => _firebaseUser;

  Future<bool> signIn(String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }
  }

  Future signOut() async {
    _firebaseAuth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<void> _onAuthStateChanged(FirebaseUser firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _firebaseUser = firebaseUser;
      _status = Status.Authenticated;
    }
    notifyListeners();
  }

}