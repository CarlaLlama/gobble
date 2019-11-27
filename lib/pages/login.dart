import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui/flutter_firebase_ui.dart';
import 'package:gobble/pages/home.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  StreamSubscription<FirebaseUser> _listener;

  FirebaseUser _currentUser;

  @override
  void initState() {
    super.initState();
    _checkCurrentUser();
  }

  @override
  void dispose() {
    _listener.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_currentUser == null) {
      return new SignInScreen(
        title: "Gobble",
        header: new Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: new Padding(
            padding: const EdgeInsets.all(16.0),
            child: new Text("Gobble"),
          ),
        ),
        showBar: true,
        // horizontalPadding: 8,
        bottomPadding: 5,
        avoidBottomInset: true,
        color: Color(0xFF363636),
        providers: [
          ProvidersTypes.google,
          ProvidersTypes.email
        ],
        horizontalPadding: 12,
      );
    } else {
      return new HomePage(user: _currentUser);
    }
  }

  void _checkCurrentUser() async {
    _currentUser = await _auth.currentUser();
    _currentUser?.getIdToken(refresh: true);

    _listener = _auth.onAuthStateChanged.listen((FirebaseUser user) {
      setState(() {
        _currentUser = user;
      });
    });
  }
}
