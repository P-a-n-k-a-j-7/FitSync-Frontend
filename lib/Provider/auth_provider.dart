import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../config.dart';
import '../provider/user_provider.dart';

class AuthProvider extends ChangeNotifier {
  final UserProvider userProvider;
  AuthProvider(this.userProvider);

  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Existing login function
  static Future<String?> loginUser(String email, String password) async {
    try {
      var reqBody = {"email": email, "password": password};

      var response = await http.post(
        Uri.parse(login),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(reqBody),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['message'] == 'User logged in successfully') {
          print('Login successful');
          return jsonResponse['token'];
        } else {
          print('Authentication failed: ${jsonResponse['message']}');
          return null;
        }
      } else {
        print('Server error: ${response.statusCode}');
        print('Server error: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error logging in: $e');
      return null;
    }
  }

  // Existing register function
  static Future<bool> registerUser(String name, String email, String password) async {
    try {
      var reqBody = {
        "name": name,
        "email": email,
        "password": password,
      };

      var response = await http.post(
        Uri.parse(register),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(reqBody),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['message'] == 'User registered successfully') {
          print('Registration successful');
          return true;
        } else {
          print('Registration failed: ${jsonResponse['message']}');
          return false;
        }
      } else {
        print('Server error: ${response.statusCode}');
        print('Server error: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error registering: $e');
      return false;
    }
  }

  // New Google Sign-In Function
  static Future<String?> signInWithGoogle() async {
    try {
      // Trigger the Google Sign-In process
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // The user canceled the sign-in
        return null;
      }

      // Obtain the Google sign-in authentication details
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential
      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      // Check if the sign-in was successful
      if (user != null) {
        // Obtain the ID token from Firebase
        final idToken = await user.getIdToken();

        // Optional: Send the ID token to your backend for further processing (if needed)
        var response = await http.post(
          Uri.parse(googleLogin),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"idToken": idToken}),
        );

        if (response.statusCode == 200) {
          var jsonResponse = jsonDecode(response.body);
          print('Google Sign-In successful');
          return jsonResponse['token'];
        } else {
          print('Server error: ${response.statusCode}');
          print('Server error: ${response.body}');
          return null;
        }
      } else {
        print('Google Sign-In failed: No user returned');
        return null;
      }
    } catch (e) {
      print('Error during Google Sign-In: $e');
      return null;
    }
  }
}
