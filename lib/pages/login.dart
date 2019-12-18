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
          header: new Container(
               alignment: Alignment.center,
               height: 400,
               width: 400,
               child: new Icon(Icons.person_pin,
                color: Colors.green,
                size: 100,
               ),
          ),
          showBar: false,
          title: ("Gobble"),
          horizontalPadding: 10,
          bottomPadding: 10,
          avoidBottomInset: false,
          color: Colors.black,
          providers: [
            ProvidersTypes.google,
            ProvidersTypes.email,
            ProvidersTypes.phone
          ],
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
