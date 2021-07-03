import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cookbook_recipe/user/UserDetail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthServices {

  final FirebaseAuth authServices = FirebaseAuth.instance;
  final UserDetail _data = UserDetail();

  //create user object based on FirebaseUser
  UserDetail _userFirebaseUser(User user){
    return user != null ? UserDetail(uid: user.uid,email: user.email) : null;

  }

  // google Sign In process
  Future signInGoogleAuth() async{
    try{
      final GoogleSignInAccount googleUser= await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final GoogleAuthCredential credential =
      GoogleAuthProvider.credential(accessToken: googleAuth.accessToken,idToken: googleAuth.idToken);

      await FirebaseAuth.instance.signInWithCredential(credential).then((value) =>
          FirebaseFirestore.instance.collection('userDetails').doc(value.user.uid).set({"email": value.user.email})
              .then((value) => print('hello'))
      );
      return 0;
    }on FirebaseAuthException catch(e){
      print(e.toString());
      return e.toString();
    }
  }


  // SignIn or Registration Using Email and password method
  Future signInEmailPassword(String email, String password)async {
    try {
      authServices.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value){
        FirebaseFirestore.instance.collection('userData').doc(value.user.uid).set(
            {"email": value.user.email}
        );
      });
      FirebaseAuth auth = FirebaseAuth.instance;
      if (auth.currentUser != null) {
        print(auth.currentUser.uid);
        print(auth.currentUser.emailVerified);
      }
      if (auth.currentUser.emailVerified == false) {
        await auth.currentUser.sendEmailVerification();
        print('email send');
      }
      print(auth.currentUser.email);

      print('User Login');
      return 0;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return 'weak-password.';

      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return 'email-already-in-use';
      }
    }
  }

  // Login or Authentication Using Email and password method
  Future logInEmailPassword(String email, String password)async {


      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        User user = userCredential.user;
        if (user != null) {
          print(user.uid);
        }
        print('User Login');
        _data.UserData();
        print(_userFirebaseUser(user));
        return 0;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
          return 'user-not-found';
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
          return 'wrong-password';
        }
    }

  }




// Reset Password method
  Future resetPassword(String email) async{
    final String emailAddress = email;

    try {
      await authServices.sendPasswordResetEmail(email: emailAddress);

      print("email just send it........************");
      return 0;

    }on FirebaseAuthException catch(e) {
      if(e.code == 'user-not-found'){
        print('There is no user record corresponding to this identifier. The user may have been deleted.');
        return 'user-not-found';
      }if(e.code == 'too-many-requests'){
        print('We have blocked all requests from this device due to unusual activity. Try again later.');
        return 'too-many-requests';

      }else {
        print(e.toString());
        return e.toString();
      }

    }
  }



}




