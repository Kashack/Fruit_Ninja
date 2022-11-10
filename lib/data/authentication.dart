import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fruit_ninja/presentation/authentication/user_bio.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../presentation/main_screens/home_page.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var context;

  Authentication(BuildContext context) {
    this.context = context;
  }

  SigninAuthentication({required String email, required String password}) {
    try {
      _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value){
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
      });;
    } on FirebaseAuthException catch (e) {
      if (e.code == "network-request-failed") {
        return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Network failed'),
          ),
        );
      } else if (e.code == "email-already-in-use") {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Email already in use')));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('${e.code}')));
      }
    }
  }

  CreateAnAccount(
      {required String username,
      required String email,
      required String password}) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        try {
          _firestore.collection('users').doc(_auth.currentUser!.uid).set({
            'username': username,
            'email': email,
          }).then((value){
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserBioPage(),
                ));
          });
        } on FirebaseException catch (e) {
          if (e.code == "network-request-failed") {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Network error')));
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('${e.code}')));
          }
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == "network-request-failed") {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Network error')));
      } else if (e.code == "email-already-in-use") {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Email already in use')));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('${e.code}')));
      }
    }
  }

  GoogleAuthentication() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    try{
      _auth.signInWithCredential(credential)
          .then((value){
        if (value != null){
          if(value.additionalUserInfo!.isNewUser){
            _firestore.collection('users')
                .doc(_auth.currentUser!.uid)
                .set({
              'first_name' : googleUser!.displayName!.split(' ').first,
              'last_name' : googleUser.displayName,
              'email': googleUser.email,
              'profileImage':googleUser.photoUrl
            }).then((value){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
            });
          }
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sign in with different social auth')));
      }
    }
  }
}
