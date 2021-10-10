import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ShootpointsFirebaseUser {
  ShootpointsFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

ShootpointsFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<ShootpointsFirebaseUser> shootpointsFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<ShootpointsFirebaseUser>(
        (user) => currentUser = ShootpointsFirebaseUser(user));
