import 'package:clientapp/modules/screens/homePage.dart';
import 'package:clientapp/modules/screens/loginScreen.dart';
import 'package:clientapp/modules/screens/mainScreen.dart';
import 'package:clientapp/modules/screens/players/musicDetail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MainScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }

  //signn out meth
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  //sign in method
  signIn(email, password) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((user) => print(user.credential))
        .catchError((e) {
      print(e);
    });
  }

  //sign in with google method

  //sign up
  signUp(email, password) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((user) => print("signed in"))
        .catchError((e) {
      print(e);
    });
  }
}

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignIn? _user;

  //create getter

  GoogleSignIn? get user => _user;

  Future googleLogIn() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser as GoogleSignIn?;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
    notifyListeners();
  }
}
